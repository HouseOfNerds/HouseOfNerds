# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  COOKIE_DOMAIN = 'support.datek.no'

  included do
    before_action :require_login
    after_action :clear_user
  end

  private

  def clear_user
    Thread.current[:user] = nil
  end

  def login_by_token
    key = params[:key]&.strip
    return if key.blank?
    user = Administrator.find_by(security_token: key)
    unless user
      flash.alert = 'Your login link has expired.'
      return
    end
    return if user.security_token_stored_at < 1.day.ago
    session[:user_id] = user.id
    @_current_user = user
  end

  def login_by_cookie
    if (user_id_cookie = cookies.encrypted[:user_id])
      if (user = User.find_by(id: user_id_cookie))
        session[:user_id] = user.id
        @_current_user = user
      end
    end
    user
  end

  def login_by_session
    @_current_user = session[:user_id] && Administrator.find_by(id: session[:user_id])
  end

  def current_user
    return @_current_user if @_current_user
    login_by_session || login_by_cookie || login_by_token
    return unless @_current_user
    Thread.current[:user] = @_current_user
    cookies.encrypted[:user_id] = { domain: COOKIE_DOMAIN, value: @_current_user.id,
                                    expires: 7.days.from_now }
    @_current_user
  end

  def require_login
    redirect_to login_path unless current_user
  end
end

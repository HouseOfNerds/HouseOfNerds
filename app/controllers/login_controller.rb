# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :require_login

  def login
    redirect_to root_path if current_user
  end

  def logout
    session.delete(:user_id)
    cookies.delete(:user_id, domain: COOKIE_DOMAIN)
    redirect_to root_path
  end

  def send_email
    return unless (email = redirect_if_no_email)
    return if redirect_if_not_hon(email)
    return unless (@user = redirect_if_no_administrator(email))

    @user.generate_security_token

    LoginMailer.login_link(@user).deliver_now
  end

  private

  def redirect_if_no_email
    email = params[:email]&.strip&.downcase
    return email if email.present?
    redirect_to :login, notice: 'Vennligst skriv inn din e-post'
    false
  end

  def redirect_if_not_hon(email)
    return if email.match?(Administrator::HON_EMAIL_PATTERN)
    redirect_to :login, notice: 'Innlogging via web er foreløpig ikke tilgengelig.'
    true
  end

  def redirect_if_no_administrator(email)
    user = Administrator.find_by(email: email)
    return user if user
    redirect_to :login, notice: 'Beklager, men vi kunne ikke finne noen bruker med den e-posten.'
    nil
  end
end

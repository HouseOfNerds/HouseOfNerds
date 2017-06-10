# frozen_string_literal: true

module ApplicationHelper
  def current_user
    @_current_user ||= Thread.current[:user]
  end
end

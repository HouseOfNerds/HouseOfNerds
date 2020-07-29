# frozen_string_literal: true

unless Rails.env.production?
  require 'sandbox_email_interceptor'
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end

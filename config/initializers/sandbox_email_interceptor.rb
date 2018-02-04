# frozen_string_literal: true

ActionMailer::Base.register_interceptor(SandboxEmailInterceptor) unless Rails.env.production?

# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.env.production? ? 'post@houseofnerds.no' : 'hon@example.com'
  layout 'mailer'
end

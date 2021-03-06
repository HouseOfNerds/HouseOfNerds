# frozen_string_literal: true

class Administrator < ApplicationRecord
  HON_EMAIL_PATTERN = {
      development: //,
      test: /^(vegard|henrik|uwe)@example.com$/,
  }[Rails.env.to_sym] || /^uwe@kubosch.no$|@houseofnerds.no$/

  belongs_to :department

  before_validation { self.email = email.downcase if email_changed? }

  validates :department_id, :email, presence: true
  validates :security_token_stored_at, presence: true, if: :security_token

  def generate_security_token
    update! security_token: SecureRandom.hex, security_token_stored_at: Time.current
    security_token
  end
end

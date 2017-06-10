# frozen_string_literal: true

class Customer < ApplicationRecord
  before_validation { self.email = email.downcase.strip if email_changed? }

  validates :email, presence: true
end

# frozen_string_literal: true

class Administrator < ApplicationRecord
  has_secure_password

  validates :email, presence: true
end

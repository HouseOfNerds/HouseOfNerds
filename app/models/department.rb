# frozen_string_literal: true

class Department < ApplicationRecord
  validates :name, :domain, presence: true, uniqueness: { case_sensitive: true }
end

# frozen_string_literal: true

puts 'loading department model'

class Department < ApplicationRecord
  validates :name, :domain, presence: true, uniqueness: { case_sensitive: true }
end

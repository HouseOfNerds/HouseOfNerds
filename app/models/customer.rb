# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy

  before_validation { self.email = email.downcase.strip if email_changed? }

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def image=(file)
    # self.filename = file.original_filename
    self.image_content_type = file.content_type
    self.image_content = file.read
  end
end

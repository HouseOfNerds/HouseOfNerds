# frozen_string_literal: true

class Customer < ApplicationRecord
  before_validation { self.email = email.downcase.strip if email_changed? }

  validates :email, presence: true

  def image=(file)
    # self.filename = file.original_filename
    self.image_content_type = file.content_type
    self.image_content = file.read
  end
end

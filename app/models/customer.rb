# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :loans, dependent: :destroy

  before_validation { self.email = email.downcase.strip if email_changed? }

  validates :email, presence: true, uniqueness: {
      case_sensitive: false,
      message: ->(_, data) do
        "er allerede i bruk: <a href='/search?q=#{data[:value]}'>#{data[:value]}</a>"
      end,
  }
  validates :address, :birthdate, :name, :postal_code, presence: true

  def image=(file)
    # self.filename = file.original_filename
    self.image_content_type = file.content_type
    self.image_content = file.read
  end

  def age
    date = Date.current
    offset = (birthday_upcoming?(date) ? 0 : 1)
    date.year - birthdate.year - offset
  end

  private def birthday_upcoming?(now)
    now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)
  end

  AGE_GROUPS = [7, 12, 16, 18].reverse.freeze
  def parental_control_message
    age_group = AGE_GROUPS.find { |ag| age >= ag }
    return 'Kun ifølge med voksne' unless age_group
    age_group_idx = AGE_GROUPS.index(age_group)
    age_group_idx -= 1 if parental_approval && age_group_idx > 0
    "PEGI-#{AGE_GROUPS[age_group_idx]}"
  end

  def birthday_today?
    today = Date.current
    birthdate_this_year = Date.new(today.year, birthdate.mon, birthdate.day)
    birthdate_this_year == today
  end
end

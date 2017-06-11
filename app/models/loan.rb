# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :customer
  belongs_to :asset_type

  validates :customer_id, :asset_type_id, presence: true

  scope :today, -> { where('created_at >= :today', today: Time.zone.now.beginning_of_day) }
  scope :yesterday, -> {
    where('created_at >= :yesterday AND created_at < :today',
        yesterday: Time.zone.now.beginning_of_day - 1.day, today: Time.zone.now.beginning_of_day)
  }
  scope :outstanding, -> { where(returned_at: nil) }
  scope :returned, -> { where.not(returned_at: nil) }
  scope :today_or_outstanding, -> { today.or(outstanding) }
end

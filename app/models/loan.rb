# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :customer
  belongs_to :asset_type

  validates :customer_id, :asset_type_id, presence: true

  scope :today_or_outstanding, -> { where('created_at >= :today OR returned_at IS NULL', today: Time.zone.now.beginning_of_day) }
  # Event.where('start_at >= ? and start_at <= ?', Time.zone.now, Time.zone.now.end_of_day)
end

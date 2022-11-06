# frozen_string_literal: true

class Liquor < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
  validates :percentage, presence: true
  validates :amount, presence: true
  VALID_STATUSES = %w[on_sale booked sold_out].freeze

  validates :status, inclusion: { in: VALID_STATUSES }
end

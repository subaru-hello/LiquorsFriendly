# frozen_string_literal: true

class Liquor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
  validates :percentage, precsence: true
  validates :amount, presence: true
end

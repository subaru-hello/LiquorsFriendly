# frozen_string_literal: true

class Liquor < ApplicationRecord
  has_many :comments

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
  validates :percentage, presence: true
  validates :amount, presence: true
end

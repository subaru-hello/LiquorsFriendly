# frozen_string_literal: true

class Drinking < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :liquors, through: :tags, dependent: :destroy
  def start_time
    starts_at # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end

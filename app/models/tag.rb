# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :liquor
  belongs_to :drinking
end

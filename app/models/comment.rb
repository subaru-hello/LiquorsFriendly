# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :liquor

  validates :body, presence: true
  validates :commenter, presence: true
end

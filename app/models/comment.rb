# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :liquor
  belongs_to :user
  validates :body, presence: true
  validates :commenter, presence: true

  VALID_STATUSES = %w[public private archived].freeze

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end

# frozen_string_literal: true

class AddUserIdToComment < ActiveRecord::Migration[7.0]
  def up
    'DELETE FROM comments;'
    add_reference :comments, :user, index: true
  end

  def down
    remove_reference :comments, :user, index: true
  end
end

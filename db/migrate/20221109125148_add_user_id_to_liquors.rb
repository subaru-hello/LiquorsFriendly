# frozen_string_literal: true

class AddUserIdToLiquors < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM liquors;'
    add_reference :liquors, :user, null: false, index: true
  end

  def down
    remove_reference :liquors, :user, index: true
  end
end

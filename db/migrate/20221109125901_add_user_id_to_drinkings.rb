# frozen_string_literal: true

class AddUserIdToDrinkings < ActiveRecord::Migration[7.0]
  def up
    'DELETE FROM drinkings;'
    add_reference :drinkings, :user, index: true
  end

  def down
    remove_reference :drinkings, :user, index: true
  end
end

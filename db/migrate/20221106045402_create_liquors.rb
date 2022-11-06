# frozen_string_literal: true

class CreateLiquors < ActiveRecord::Migration[7.0]
  def change
    create_table :liquors do |t|
      t.string :name
      t.float :percentage
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end

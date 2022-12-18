# frozen_string_literal: true

class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :title, :string
  end
end

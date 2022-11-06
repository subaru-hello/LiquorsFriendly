# frozen_string_literal: true

class AddStatusToLiquors < ActiveRecord::Migration[7.0]
  def change
    add_column :liquors, :status, :string
  end
end

class RemoveUserIdFromLiquors < ActiveRecord::Migration[7.0]
  def up
    remove_reference :liquors, :user, index: true
  end
  
  def down
    add_reference :liquors, :user, index: true
  end
end

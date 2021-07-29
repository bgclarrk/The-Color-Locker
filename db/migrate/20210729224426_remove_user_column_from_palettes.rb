class RemoveUserColumnFromPalettes < ActiveRecord::Migration[6.1]
  def change
    remove_column :palettes, :user_id
  end
end

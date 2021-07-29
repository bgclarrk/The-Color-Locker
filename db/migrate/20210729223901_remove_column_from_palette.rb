class RemoveColumnFromPalette < ActiveRecord::Migration[6.1]
  def change
    remove_index :palettes, column: :user_id
  end
end

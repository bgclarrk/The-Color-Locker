class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.string :hexidecimal
      t.timestamps
      t.belongs_to :palette
    end
  end
end

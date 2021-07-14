class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :subject
      t.timestamps
      t.belongs_to :project
    end
  end
end

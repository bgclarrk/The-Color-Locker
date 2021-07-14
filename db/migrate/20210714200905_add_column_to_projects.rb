class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :palette, foreign_key: true
  end
end

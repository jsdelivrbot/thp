class AddColumnToMousaillon < ActiveRecord::Migration[5.1]
  def change
    add_column :mousaillons, :name, :string
  end
end

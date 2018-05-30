class AddColumnToMousaillon2 < ActiveRecord::Migration[5.1]
  def change
    add_column :mousaillons, :sign_up_code, :string
  end
end

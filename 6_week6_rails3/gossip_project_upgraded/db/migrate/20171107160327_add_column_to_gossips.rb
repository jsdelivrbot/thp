class AddColumnToGossips < ActiveRecord::Migration[5.1]
  def change
    add_column :gossips, :number_likes, :integer, :default => 0
  end
end

class CreateGossips < ActiveRecord::Migration[5.1]
  def change
    create_table :gossips do |t|
      t.string :author
      t.text :content
      t.integer :mousaillard_id

      t.timestamps
    end
  end
end

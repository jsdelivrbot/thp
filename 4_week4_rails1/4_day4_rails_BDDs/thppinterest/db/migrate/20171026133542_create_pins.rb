class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end

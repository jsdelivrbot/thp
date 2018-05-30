class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
          t.integer :duration
    t.datetime :departure_date
    t.integer :departure_airport_id
    t.integer :arrival_airport_id
      t.timestamps
    end
  end
end

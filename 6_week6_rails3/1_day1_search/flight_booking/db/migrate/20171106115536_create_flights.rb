class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.datetime :departure_date
      t.integer :departure_airport
      t.integer :arrival_airport

      t.timestamps
    end
  end
end

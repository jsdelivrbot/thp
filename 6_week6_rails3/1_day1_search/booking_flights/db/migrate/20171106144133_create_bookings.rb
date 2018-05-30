class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :flight_id
      t.integer :reference_number

      t.timestamps
    end
  end
end

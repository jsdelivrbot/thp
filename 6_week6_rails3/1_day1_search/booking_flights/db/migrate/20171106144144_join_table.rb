class JoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_passengers, :id => false do |t|
        t.integer :booking_id, index: true
        t.integer :passenger_id, index: true
    end
  end
end

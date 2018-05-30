class Airport < ApplicationRecord
    has_many :departure_flights, :foreign_key => :departure_airport, :class_name => 'Flight'
    has_many :arrival_flights, :foreign_key => :arrival_airport, :class_name => 'Flight'
end

class FlightsController < ApplicationController


  def index

    @all_flights = Flight.all
    @airports = Airport.all
    @airports_options = @airports.map{ |u| [ u.airport_code, u.id ] }
    @dates_options = @all_flights.pluck(:departure_date).map{|i| [i.strftime("%d/%m/%Y"),i]}.uniq.sort_by!{|flight_dates| flight_dates}
    @passengers_options = (1..4)
    @flights = Flight.search(params)
  end

  def flight_params
    params.require(:flight).permit(:search_departure_date, :search_departure_airport_id, :search_arrival_airport_id, :search_number_passengers)
  end
end

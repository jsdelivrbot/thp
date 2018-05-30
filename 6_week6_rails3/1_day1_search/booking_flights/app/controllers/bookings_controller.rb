class BookingsController < ApplicationController
  def new
        @booking = Booking.new
        @flight = Flight.find_by(id: booking_params[:flight_id])
        @number = booking_params[:search_number_passengers].to_i
        @passenger = Array.new(@number) { @booking.passengers.build }
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def create
      @booking = Booking.create(flight_id: params[:booking][:flight_id])
      @booking.save
      params[:booking][:passenger].each do |passenger|
      @booking.passengers.create(name: passenger[:name], email: passenger[:email])
    end
    redirect_to @booking
  end

  private

  def booking_params
    params.permit(:search_number_passengers,:flight_id, passenger: [:name, :email])
  end
end

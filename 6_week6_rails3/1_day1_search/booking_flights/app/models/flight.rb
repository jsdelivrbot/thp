class Flight < ApplicationRecord
    belongs_to :arrival_airport, :class_name => 'Airport'
    belongs_to :departure_airport, :class_name => 'Airport'
    has_many :bookings

  def self.search(params)
      if !params[:search_departure_date].nil?
        where('departure_airport_id LIKE ? AND arrival_airport_id LIKE ? AND departure_date LIKE ?', "%#{params[:search_departure_airport_id]}%","%#{params[:search_arrival_airport_id]}%","%#{params[:search_departure_date]}%".to_datetime).order('id DESC')
      else
        all
      end
  end

end

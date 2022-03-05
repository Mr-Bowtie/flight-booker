class FlightsController < ApplicationController
  def index
    @flight_date_options = Flight.get_dates
    @airport_options = Airport.all.map { |airport| [airport.location, airport.code] }
    @flights = Flight.search(params[:search)
  end
end

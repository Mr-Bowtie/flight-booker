class Flight < ApplicationRecord
  belongs_to :arriving_airport, class_name: 'Airport'
  belongs_to :departing_airport, class_name: 'Airport'

  def self.search(input)
    self.where('departing_airport = ? and arriving_airport = ? and DATE(departure_time) = ?', input[0], input[1])
  end

  def self.get_dates
    datetimes = Flight.select(:departure_time).distinct
    datetimes.map { |flight| flight.format_flight_date }.uniq
  end

  def format_flight_date
    departure_time.strftime('%m-%d-%Y')
  end
end

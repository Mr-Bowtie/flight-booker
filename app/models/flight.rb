class Flight < ApplicationRecord
  belongs_to :arriving_airport, class_name: 'Airport'
  belongs_to :departing_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(input)
    if input.nil?
      nil
    else
      self.where('departing_airport_id = ? and arriving_airport_id = ? and DATE(departure_time) = ?', input['departing_airport'], input['arriving_airport'], Date.parse(input['flight_date']))
    end
  end

  def self.get_dates
    datetimes = Flight.select(:departure_time).distinct
    datetimes.map { |flight| flight.format_flight_date }.uniq
  end

  def format_flight_date
    departure_time.strftime('%B-%d-%Y')
  end
end

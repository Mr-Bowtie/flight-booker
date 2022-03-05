# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tables = [Airport, Flight]
airport_details = [['San Francisco, CA', 'SFO'], ['Dallas, TX', 'DFW'], ['Philadelphia, PA', 'PHL']]
durations = {
  'SFO' => {
    'DFW' => 1,
    'PHL' => 2,
  },
  'DFW' => {
    'SFO' => 1,
    'PHL' => 3,
  },
  'PHL' => {
    'SFO' => 2,
    'DFW' => 3,
  },
}

start = Date.today
finish = (Date.today + 31.days)

# tables.each { |table| table.delete_all }
airport_details.each { |location, code| Airport.create(code: code, location: location) }

Airport.all.each do |airport|
  destinations = Airport.where('code != ?', airport.code).all
  destinations.each do |dest|
    (start..finish).each do |date|
      Flight.create(flight_duration: durations[airport.code][dest.code], departure_time: date.to_s + ' 07:00:00', departing_airport_id: airport.id, arriving_airport_id: dest.id)
      Flight.create(flight_duration: durations[airport.code][dest.code], departure_time: date.to_s + ' 12:00:00', departing_airport_id: airport.id, arriving_airport_id: dest.id)
      Flight.create(flight_duration: durations[airport.code][dest.code], departure_time: date.to_s + ' 17:00:00', departing_airport_id: airport.id, arriving_airport_id: dest.id)
    end
  end
end

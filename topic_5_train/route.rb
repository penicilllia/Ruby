class Route
  attr_reader :station_list
  def initialize(first_station, end_station)
    @first_station = first_station
    @end_station = end_station
    @station_list = [@first_station, @end_station]
  end

  def add_station(station)
    @station_list.insert(-2, station)
  end

  def remove_station(station)
    @station_list.delete(station) if @station_list.include?(station)
  end
end

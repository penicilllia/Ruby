class Route
  attr_reader :station_list
  include InstanceCounter  

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @station_list = [@first_station, @last_station]
  end

  def add_station(station)
    @station_list.insert(-2, station)
  end

  def remove_station(station)
    @station_list.delete(station) if @station_list.include?(station)
  end
end

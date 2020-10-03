class Route
  attr_reader :station_list
  def initialze(first_station, end_station)
    @first_station = first_station
    @end_station = end_station
    @station_list = [@first_station, @end_station]
  end

  def add_station(station)
    @station_list.delete_at(-1)
    @station_list.push(station)
    @station_list.push(@end_station)
  end

  def remove_station(station)
    @station_list.delete(station) if @station_list.include?(station)
  end
end

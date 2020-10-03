class Train
  attr_accessor :speed
  attr_reader :train_car_count

  # все методы, которые относятся к классу Train, заносятся в protected, потому что это родительский класс
  # и наследующие классы должны иметь доступ к его методам.  
  
  protected
  def initialize(train_number, train_car_count)
    @train_number = train_number
    @train_car_count = train_car_count
  end

  def stop
    @speed = 0
  end

  def take_route(route)
    @cur_station = route.station_list[0]
  end

  def move_forward(route)
    i = route.station_list.index(@cur_station)
    @cur_station = route.station_list[i + 1]
  end 

  def move_back(route)
    i = route.station_list.index(@cur_station)
    @cur_station = route.station_list[i - 1]
  end 

  def forward_station(route)
    i = route.station_list.index(@cur_station)
    forw_station = route.station_list[i + 1]
    forw_station
  end 

  def previouse_station(route)
    i = route.station_list.index(@cur_station)
    prev_station = route.station_list[i - 1]
    prev_station
  end 

end
class Train
  attr_accessor :speed
  attr_reader :train_car_count

  # все методы, которые относятся к классу Train, заносятся в protected, потому что это родительский класс
  # и наследующие классы должны иметь доступ к его методам.  
  
  
  def initialize(train_number)
    @train_number = train_number
    @local_route = []
  end

  def stop
    @speed = 0
  end

  def take_route(route)
    @cur_station = route.station_list[0]
    @local_route = route
  end

  def move_forward
    i = @local_route.index(@cur_station)
    @cur_station.remove_train(self)
    @cur_station = @local_route[i + 1]
    @cur_station.add_train(self)
  end 

  def move_back
    i = @local_route.index(@cur_station)
    @cur_station.remove_train(self)
    @cur_station = @local_route[i - 1]
    @cur_station.add_train(self)
  end 

  def forward_station
    i = @local_route.index(@cur_station)
    forw_station = @local_route[i + 1]
    forw_station
  end 

  def previouse_station
    i = @local_route.index(@cur_station)
    prev_station = @local_route[i - 1]
    prev_station
  end 

end
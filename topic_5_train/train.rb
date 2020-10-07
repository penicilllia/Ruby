class Train
  attr_accessor :speed 
  attr_reader :local_route, :cur_station
  
  def initialize(train_number)
    @train_number = train_number
    @local_route = []
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def take_route(route)
    @cur_station = route.station_list[0]
    @local_route = route
    @cur_station.add_train(self)
  end

  def index
    @local_route.station_list.index(@cur_station)
  end

  def move_forward
    @cur_station.remove_train(self)
    @cur_station = @local_route.station_list[index + 1]
    @cur_station.add_train(self)
  end 

  def move_back
    @cur_station.remove_train(self)
    @cur_station = @local_route.station_list[index - 1]
    @cur_station.add_train(self)
  end 

  def forward_station
    @local_route.station_list[index + 1]
  end 

  def previouse_station
    @local_route.station_list[index - 1]
  end 
end
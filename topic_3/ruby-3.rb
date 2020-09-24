class Station 
  attr_reader :trains_on_station
  attr_reader :list_train

  def initialize(name)
    @name = name
    @list_train = []
  end

  def add_train(train)
    @list_train << train
  end

  def remove_train(train)
    @list_train.delete(train)
  end

  def list_train_pass
    passanger_trains = list_train.select { |train| train.train_type == 'passanger' } 
    passanger_trains.count
  end

  def list_freight_train
    freight_trains = list_train.select { |train| train.train_type == 'freight' } 
    freight_trains.count
  end
end


class Route
  attr_reader :station_list
  def initialze(first_station, end_station)
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


class Train
  attr_accessor :speed
  attr_reader :train_car_count

  def initialize(train_number, train_type, train_car_count)
    @train_number = train_number
    @train_type = train_type
    @train_car_count = train_car_count
  end

  def stop
    @speed = 0
  end

  def change_train_car(action)
    if @speed == 0 && action == 'add'
      @train_car_count += 1
    end
    if @speed == 0 && action == 'remove'
      @train_car_count -= 1
    end
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

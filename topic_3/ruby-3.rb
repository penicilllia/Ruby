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
    count = 0
    list_train.each do |train|
      if train.train_type == "passenger"
        count += 1
      end
    end
    count
  end

  def list_freight_train
    count = 0
    list_train.each do |train|
      if train.train_type == "freight"
        count += 1
      end
    end
    count
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
    @station_list.delete_at(-1)
    @station_list.push(station)
    @station_list.push(@end_station)
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

  def change_train_car(bool)
    if @speed == 0 && bool == true
      @train_car_count += 1
    end
    if @speed == 0 && bool == false
      @train_car_count -= 1
    end
  end

  def take_route(route)
    @train_route = route.station_list
    @cur_station = @train_route[0]
    @pair_station = [self, @cur_station]
  end

  def move_forward
    i = 0
    while @train_route[i] != @cur_station

    @pair_station = [self, @cur_station]

end


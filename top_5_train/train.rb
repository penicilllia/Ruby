require_relative 'module_company_name.rb'
class Train
  include CompanyName
  attr_accessor :speed, :cargo_list
  attr_reader :local_route, :cur_station, :name

  def self.find(train_name)
    obj_array = ObjectSpace.each_object(self).to_a
    puts '000000000000- train classssssssssssssssssss'
    puts obj_array
    puts '8888888888888888888 - тут чуть выше массив объектов поездов 8888'
    obj_array.each do |train|
      if train.name == train_name
        return train
      end
    end
  end
  
  def initialize(train_number)
    @name = train_number
    @local_route = []
    @speed = 0
    @cargo_list = []
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

  def add_carriage(carriage)
    @cargo_list.push(carriage) if carriage.type === @type
  end

  def del_carriage(carriage)
    @cargo_list.delete(carriage)
  end

end
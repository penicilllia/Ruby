# frozen_string_literal: true

require_relative 'module_company_name.rb'
require_relative 'module_instance_counter.rb'
require_relative 'module_acсessors.rb'
require_relative 'module_validation.rb'
require_relative 'carriage.rb'

class Train
  include CompanyName
  include InstanceCounter
  include Acсessors
  attr_accessor :speed, :cargo_list
  attr_reader :local_route, :cur_station, :name

  NUMBER_FORMAT = /^[\w\d]{3}(-|)[\w\d]{2}$/i.freeze

  def initialize(train_number)
    @name = train_number
    @local_route = []
    @speed = 0
    @cargo_list = []
    register_instance
    validate!
  end

  def validate!
    raise 'Номер поезда записывается по-другому!' if @name.to_s !~ NUMBER_FORMAT
  end

  def self.find(train_name)
    obj_array = ObjectSpace.each_object(self).to_a
    indicator = 0
    obj_array.each do |train|
      train.name == train_name ? train : indicator += 1
      return nil if indicator == obj_array.size
    end
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
    @cargo_list.push(carriage) if carriage.type == @type
  end

  def del_carriage(carriage)
    @cargo_list.delete(carriage)
  end

  def all_carriages(&block)
    if block_given?
      @cargo_list.each do |carriage|
        block.call(carriage)
      end
    end
  end
end

# vag1 = Carriage.new('iuchaeichwei', 100)
# Train.strong_attr_accessor('vagon', Carriage)
# tr1.vagon = vag1
# p tr1.vagon


# Train.attr_accessor_with_history('a', 'b', 'c')
# tr1 = Train.new('34a-hh')
# tr1.a = 'aaa'
# tr1.b = 'bbb'
# tr1.c = 'cccc'
# tr1.a = 'aaaaaaaaaaaa'
# tr1.a = 'aaaaaaaaaadddddddddaa'
# p tr1.a_history

# tr1.b = '111111111111111111111111111111111111'
# p tr1.b_history



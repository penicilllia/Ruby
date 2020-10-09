require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'carriage.rb'

class Railsway
  attr_reader :station_list, :pass_train_list, :cargo_train_list, :route_list
  def initialize()
    @station_list = []
    @train_list = []
    @route_list = []
    @input = 0
    @carriage_list = []
  end
  
  def interface
    while @input != 9
      print_interface
      @input = gets.chomp.to_i
      case @input
      when 1
        create_station
      when 2
        creare_train
      when 3
        create_route_and_route_control
      when 4
        route_to_train
      when 5
        add_carriage_to_train
      when 6
        del_carriage_from_train
      when 7
        move_train
      when 8
        show_trains_or_stations
      end #case
    end #while
  end #interface

  private

  def print_interface
    puts
    puts 'Введите номер действия, которое хотите выполнить:'
    puts '1. Создать станцию.'
    puts '2. Создать поезд.'
    puts '3. Создать маршрут или управлять станциями в маршруте (добавить, удалить).'
    puts '4. Назначить маршрут поезду.'
    puts '5. Добавить вагон к поезду.'
    puts '6. Отцепить вагон от поезда.'
    puts '7. Перемещать пезд по маршруту вперед и назад.'
    puts '8. Посмотреть список станций и список поездов на станции.'
    puts '9. Выход.'
    puts
  end

  def print_trains
    @train_list.each_with_index do |train, index|
      print index
      print ": "
      puts train.name
    end
  end

  def print_stations
    @station_list.each_with_index do |station, index|
      print index
      print ": "
      puts station.name
    end
  end

  def print_route
    puts
    @route_list.each_with_index do |route, index|
      print index
      puts ": "
      route.station_list.each do |station|
        print station.name
        print ', '
      end
      puts
    end
  end

  def print_carriages(train_index) #вывод вагонов, прицепленных к поезду
    @train_list[train_index].cargo_list.each_with_index do |cargo, index|
      print index
      print ": "
      puts cargo.name
    end
  end

  def print_all_carriages
    @carriage_list.each_with_index do |carriage, index|
      print index
      print ': '
      puts carriage
    end
  end


  def create_station
    puts 'Введите название станции:'
    @station_name = gets.chomp
    @new_station = Station.new(@station_name)
    @station_list.push(@new_station)
  end

  def creare_train
    puts 'Введите название (номер) поезда: '
    @train_name = gets.chomp
    puts 'Укажите тип пезда (1 если пассажирский, 2 если грузовой): '
    train_type = gets.chomp.to_i
    if train_type == 1
      @train_list.push(PassengerTrain.new(@train_name))
    elsif train_type == 2
      @train_list.push(CargoTrain.new(@train_name))
    else
      puts 'Такого типа поездов нет!'
    end
  end

  def create_route_and_route_control
    puts 'Введите 1, если хотите создать маршрут и 2, если хотите редактировать существующий маршрут.'
    user_chose = gets.chomp.to_i
    if user_chose == 1
      create_route
    elsif user_chose == 2
      route_control
    else
      puts 'Такого варианта не существует!'
    end
  end

  def create_route
    print_stations
    puts 'Введите индекс первой станции в маршруте, а затем конечной:'
    first_station_index = gets.chomp.to_i
    last_station_index = gets.chomp.to_i
    @first_route_station = @station_list[first_station_index]
    @last_route_station =  @station_list[last_station_index]
    @route_list.push(Route.new(@first_route_station, @last_route_station))
  end

  def route_control
    print_route
    puts 'Введите индекс маршрута, который хотите редактировать:'
    route_index = gets.chomp.to_i
    @edited_route = @route_list[route_index]
    puts 'Введите 1, если хотите добавить станцию и 2, если удалить: '
    user_chose = gets.chomp.to_i
    print_stations
    puts 'Введите индекс станции: '
    chose_station_index = gets.chomp.to_i
    @chose_station = @station_list[chose_station_index]
    if user_chose == 1
      @edited_route.add_station(@chose_station)
    elsif user_chose == 2
      @edited_route.remove_station(@chose_station)
    else
      puts 'Такого варианта нет!'
    end
    print @edited_route.station_list
  end

  def route_to_train
    print_trains
    puts 'Введите индекс поезда: '
    train_index = gets.chomp.to_i
    print_route
    puts 'Введите индекс маршрута: '
    route_index = gets.chomp.to_i
    @train_list[train_index].take_route(@route_list[route_index])
  end

  def add_carriage_to_train
    puts 'Введите 1, если хотите создать вагон и 2, если прицепить существующий вагон: '
    user_chose = gets.chomp.to_i
    if user_chose == 1
      puts 'Введите название вагона: '
      @carriage_name = gets.chomp
      puts 'Введите 1, если тип вагона пассажирский и 2, если грузовой: '
      carriag_type = gets.chomp.to_i
      if carriag_type == 1
        @carriage_list.push(PassengerCarriage.new(@carriage_name, 'passenger'))
      elsif carriag_type == 2
        @carriage_list.push(CargoCarriage.new(@carriage_name, 'cargo'))
      else 
        puts 'Такого типа вагонов нет!'
      end
    elsif user_chose == 2
      print_trains
      puts 'Введите индекс нужного поезда:'
      train_index = gets.chomp.to_i
      print_all_carriages
      puts 'Введите индекс вагона:'
      carriage_index = gets.chomp.to_i
      if @train_list[train_index].type == @carriage_list[carriage_index].type
        @train_list[train_index].add_carriage(@carriage_list[carriage_index])
      else
        puts 'Типы вагона и поезда не совпадают!'
      end
      print_carriages(train_index)
    end
  end

  def del_carriage_from_train
    print_trains
    puts 'Введите индекс нужного поезда: '
    train_index = gets.chomp.to_i
    print_carriages(train_index)
    puts 'Введите индекс отцепляемого вагона: '
    carriage_index = gets.chomp.to_i
    @train_list[train_index].del_carriage(@train_list[train_index].cargo_list[carriage_index])
  end

  def move_train
    print_trains
    puts 'Введите индекс поезда: '
    train_index = gets.chomp.to_i
    puts 'Введите 1, если хотите отправить поезд вперед и 2, если назад: '
    train_direction = gets.chomp.to_i
    if train_direction == 1
      @train_list[train_index].move_forward
    elsif train_direction == 2
      @train_list[train_index].move_back
    else
      puts 'Такого направленеия нет!'
    end
  end

  def show_trains_or_stations
    puts 'Введите 1, если хотите посмотреть список станций и 2, если хотите посмотреть список поезов на станции: '
    user_chose = gets.chomp.to_i
    if user_chose == 1
      print_stations
      puts
    elsif user_chose == 2
      print_stations
      puts 'Укажите индекс станции, на которой вы хотите посмотреть поезда: '
      station_index = gets.chomp.to_i
      print @station_list[station_index].list_train_name
      puts
    else
      puts 'Такого варианта нет!'
    end
  end
  
end #class
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_carrige.rb'

class Railsway
  attr_reader :station_list, :pass_train_list, :cargo_train_list, :route_list
  def initialize()
    @station_list = []
    @passenger_train_list = []
    @cargo_train_list = []
    @route_list = []
    @input = 0
  end
  
  def interface
    while @input != 9
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

      @input = gets.chomp.to_i
      case @input
      when @input == 1
        one_create_station
      when @input == 2
        two_creare_train
      when @input == 3
        puts 'Введите 1, если хотите создать маршрут и 2, если хотите редактировать маршрут.'
        user_chose = gets.chomp.to_i
        if user_chose == 1
          three_create_route
        elsif user_chose == 2
          three_route_control
        else
          puts 'Такого варианта не существует!'
        end

      end #case
    end #while

    def one_create_station
      puts 'Введите название станции:'
      @station_name = gets.chomp
      @new_station = Station.new(@station_name)
      @passenger_train_list.push(@new_station)
    end

    def two_creare_train
      puts 'Введите название (номер) поезда: '
      @train_name = gets.chomp
      puts 'Укажите тип пезда (1 если пассажирский, 2 если грузовой): '
      train_type = gets.chomp.to_i
      if train_type == 1
        @passenger_train_list.push(PassengerTrain.new(@train_name))
      elsif train_type == 2
        @cargo_train_list.push(CargoTrain.new(@train_name))
      else
        puts 'Такого типа поездов нет!'
      end
    end

    def three_create_route
      print @station_list
      puts 'Введите сначала индекс первой станции в маршруте, а затем конечной:'
      first_station_index = gets.chomp.to_i
      last_station_index = gets.chomp.to_i
      @first_route_station = @station_list[first_station_index]
      @last_route_station =  @station_list[last_station_index]
      @route_list.push(Route.new(@first_route_station, @last_route_station))
      p @route_list
    end

    def three_route_control
      print @route_list
      puts 'Введите индекс маршрута, который хотите редактировать:'
      route_index = gets.chomp.to_i
      @edited_route = @route_list[route_index]
      puts 'Введите 1, если хотите добавить станцию и 2, если удалить: '
      user_chose = gets.chomp.to_i
      print @station_list
      puts 'Введите индекс станции: '
      chose_station_index = gets.chomp.to_i
      @chose_station = @station_list[chose_station_index]
      if user_chose == 1
        @edited_route.add_station(@chose_station)
        p @edited_route
      elsif user_chose == 2
        @edited_route.remove_station(@chose_station)
        p @edited_route
      else
        puts 'Такого варианта нет!'
      end
    end



  end #interface


end #class
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
    @pass_train_list = []
    @cargo_train_list = []
    @route_list = []
    #@passenger_car_list = []
    #@carrage_car_list = []
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
      puts '8. View station list and train list at station.'
      puts '9. Выход.'

      @input = gets.chomp.to_i

      case @input
      when 1
        puts 'Введите имя станции: '
        name = gets.chomp
        @station_list.push(Station.new(name))

      when 2
        puts 'Введите номер поезда: '
        name = gets.chomp
        puts 'Укажите тип поезда (1 если пассажирский, 2 если грузовой): '
        train_type = gets.chomp.to_i
        puts 'Укажите количество вагонов: '
        car_count = gets.chomp
        if train_type == 1
          @pass_train_list.push(PassengerTrain.new(name, car_count))
        elsif train_type == 2
          @cargo_train_list.push(CargoTrain.new(name, car_count))
        else
          puts 'Такого типа поезда нет!'
        end

      when 3
        puts 'Укажите что вы хотите сделать: '
        puts '1. Создать маршрут.'
        puts '2. Управление маршрутами.'
        chose = gets.chomp.to_i
        if chose == 1
          add_route1
        elsif chose == 2
          route_control
        else
          puts 'Такого варианта не существует!'
        end

      when 4
        puts 'Укажите тип поезда (1 - пассажирский, 2 - грузовой):'
        num = gets.chomp.to_i
        if num == 1
          passenger_route
        elsif num == 2
          cargo_route
        else
          puts 'Таких поездов нет!'
        end

      when 5
        puts 'Укажите тип поезда (1 - пассажирский, 2 - грузовой):'
        num = gets.chomp.to_i
        if num == 1
          add_passenger_carriage
        elsif num == 2
          add_cargo_carriage
        else
          puts 'Таких поездов нет!'
        end

      when 6
        puts 'Укажите тип поезда (1 - пассажирский, 2 - грузовой):'
        num = gets.chomp.to_i
        if num == 1
          remove_passenger_carriage
        elsif num == 2
          remove_cargo_carriage
        else
          puts 'Таких поездов нет!'
        end

      when 7
        puts 'Укажите тип поезда, которых хотите переместить (1 - пассажирский, 2 - грузовой):'
        num = gets.chomp.to_i
        if num == 1
          puts 'Пассажирские поезда:'
          puts @pass_train_list
          puts 'Укажите индекс нужного поезда:'
          index = gets.chomp.to_i
          puts 'Введите 1, если хотите продвинуться вперед и 2, если назад.'
          move = gets.chomp.to_i
          if move == 1
            @pass_train_list[index].move_forward
          elsif move == 2
            @pass_train_list[index].move_back
          else
            puts 'Так двигаться нельзя!'
          end
                
        elsif num == 2
          puts 'Грузовые поезда:'
          puts @cargo_train_list
          puts 'Укажите индекс нужного поезда:'
          index = gets.chomp.to_i
          puts 'Введите 1, если хотите продвинуться вперед и 2, если назад.'
          move = gets.chomp.to_i
          if move == 1
            @cargo_train_list[index].move_forward
          elsif move == 2
            @cargo_train_list[index].move_back
          else
            puts 'Так двигаться нельзя!'
          end
        else
          puts 'Таких поездов нет!'
        end

      when 8
        puts 'Укажите, что вы хотите сделать:'
        puts '1. Посмотреть список станций.'
        puts '2. Посмотреть список поездов на станции.'
        chose = gets.chop.to_i
        if chose == 1
          puts @station_list
        elsif chose == 2
          puts 'Введите индекс станции, у которой вы хотите посмотреть количество поездов: '
          puts @station_list
          index = gets.chomp.to_i
          @station_list[index].list_train
        else
          puts 'Такого действия не существует!'
        end
      end
    end
  end


  def add_route1
    puts 'Укажите начальную станцию в маршруте: '
    print @station_list
    puts
    first_station = gets.chomp.to_i
    puts 'Укажите конечную станцию в маршруте: '
    print @station_list
    puts
    last_station = gets.chomp.to_i
    @route_list.push(Route.new(@station_list[first_station], @station_list[last_station]))
    p @route_list
  end

  def route_control
    puts 'Выберете маршрут: '
    print @route_list
    puts
    current_route_index = gets.chomp.to_i
    puts 'Введите 1, если хотите добавить станцию и 2, если удалить.'
    chose = gets.chomp.to_i
    @current_route = @route_list[current_route_index]
    if chose == 1
      puts 'Введите индекс станции, которую хотите добавить: '
      print @station_list
      puts
      station_index = gets.chomp.to_i
      
      p @current_route
      @current_route.add_station(@station_list[station_index])

    elsif chose == 2
      puts 'Введите индекс станции, которую хотите удалить:'
      print @current_route.station_list
      puts
      station_index = gets.chomp.to_i
      @current_route.remove_station(@current_route.station_list[station_index])
    else
      puts 'Такого варианта не существует!'
    end
  end

  def passenger_route
    puts 'Пассажирские поезда:'
    puts 'Укажите индекс нужного поезда:'
    print @pass_train_list
    
    puts
    train_index = gets.chomp.to_i
    puts 'Укажите маршрут, который хотите присвоить: '
    print @route_list
    puts
    route_index = gets.chomp.to_i
    @pass_train_list[train_index].take_route(@route_list[route_index])
  end

  def cargo_route
    puts 'Грузовые поезда:'
    print @cargo_train_list
    puts
    puts 'Укажите индекс нужного поезда:'
    train_index = gets.chomp.to_i
    puts 'Укажите маршрут, который хотите присвоить: '
    print @route_list
    puts
    route_index = gets.chomp.to_i
    @cargo_train_list[train_index].take_route(@route_list[route_index])
  end

  def add_passenger_carriage
    puts 'Пассажирские поезда:'
    print @pass_train_list
    puts
    puts 'Укажите индекс нужного поезда:'
    index = gets.chomp.to_i
    puts 'Введите название вагона:'
    carriage = gets.chomp
    @new_pas_carriage = PassengerCarriage.new(carriage)
    @pass_train_list[index].add_pas_carrige(@new_carriage)
  end

  def add_cargo_carriage
    puts 'Грузовые поезда:'
    print @cargo_train_list
    puts
    puts 'Укажите индекс нужного поезда:'
    index = gets.chomp.to_i
    puts 'Введите название вагона:'
    carriage = gets.chomp
    @new_car_carriage = CargoCarriage.new(carriage)
    @cargo_train_list[index].add_car_carrige(@new_car_carriage)
  end

  def remove_passenger_carriage
    puts 'Пассажирские поезда:'
    print @pass_train_list
    puts
    puts 'Укажите индекс нужного поезда:'
    index = gets.chomp.to_i
    @pass_train_list[index].delete_at(-1)
  end

  def remove_cargo_carriage
    puts 'Грузовые поезда:'
    print @cargo_train_list
    puts
    puts 'Укажите индекс нужного поезда:'
    index = gets.chomp.to_i
    @pass_train_list[index].delete_at(-1)
  end



  def seed
    st1 = Station.new('st1')
    st2 = Station.new('st2')
    st3 = Station.new('st3')
    st4 = Station.new('st4')
    route1 = Route.new(st1, st2)
    route1.add_station(st3)
    route1.add_station(st4)
    train1 = Train.new('12345', 5)
    train1.take_route(route1)
  end



end


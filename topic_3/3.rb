=begin 
Класс Station (Станция):
+ Имеет название, которое указывается при ее создании
+ Может принимать поезда (по одному за раз)
Может возвращать список всех поездов на станции, находящиеся в текущий момент
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, 
пассажирских
+ Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка 
поездов, находящихся на станции).
=end

class Station
  def initialize(name)
    @name = name
    @current_trains = []
  end

  def add_train(@train)
    @current_trains << @train
  end
    
  ###### add your code here

  def push_train(@train)
    @current_trains.delete(@train)
  end
end


=begin 
Класс Route (Маршрут):
+ Имеет начальную и конечную станцию, а также список промежуточных станций. 
+ Начальная и конечная станции указываютсся при создании маршрута, 
  а промежуточные могут добавляться между ними.
+ Может добавлять промежуточную станцию в список
+ Может удалять промежуточную станцию из списка
+ Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route
  attr_reader :station_list
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
  end
  @station_list = [@first_station, @last_station]

  def add_station(station)
    @station_list.delete_at(-1)
    @station_list.push(station)
    @station_list.push(@last_station)
  end

  def remove_station(station)
    @station_list.delete_at(-2) if @station_list.include?(station)
  end

  def print_route
    puts "The current route consists of stations: #{@station_list}"
  end

end


=begin 
Класс Train (Поезд):
+ Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество 
  вагонов, эти данные указываются при создании экземпляра класса
+ Может набирать скорость
+ Может возвращать текущую скорость
+ Может тормозить (сбрасывать скорость до нуля)
+ Может возвращать количество вагонов
+ Может прицеплять/отцеплять вагоны (по одному вагону за операцию, 
  метод просто увеличивает или уменьшает количество вагонов). 
  Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route). 
При назначении маршрута поезду, поезд автоматически помещается на первую станцию
 в маршруте.
Может перемещаться между станциями, указанными в маршруте. Перемещение возможно
 вперед и назад, но только на 1 станцию за раз.
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train
  attr_accessor :speed, :route
  attr_reader :train_car_count
  def initialize(number, type, train_car_count)
    @number = number
    @type = type
    @train_car_count = train_car_count
  end
  
  def stop
    @speed = 0
  end

  def change(bool)
    if @speed == 0 && bool == true
      @train_car_count += 1
    end
    if @speed == 0 && bool == false
      @train_car_count -= 1
    end
  end

  def get_route
    @train_station_list = @route.station_list
    @train_cur_station = @train_station_list[0]
  end

  def train_move(bool)
    if bool = true
      



end



# @@trains = [] -- храниит список поездов
# добавить @train
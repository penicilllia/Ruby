require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_carrige.rb'

station1 = Station.new('stat1')
station2 = Station.new('stat2')
station3 = Station.new('stat3')
#p station1
#p station2
#p station3

routeone = Route.new(station1, station3)
#p routeone

trainone_pass = PassengerTrain.new('12345')
traintwo_car = CargoTrain.new('95432')
#p trainone_pass
#p traintwo_car
trainone_pass.add_carrige(PassengerCarriage.new('passenger_carriage'))
traintwo_car.add_carrige(CargoCarriage.new('cargo_carriage'))
#p trainone_pass
#p traintwo_car

trainone_pass.take_route(routeone)
traintwo_car.take_route(routeone)
#p trainone_pass.local_route

routeone.add_station(station2)
#p trainone_pass.local_route

##p 'trainone_pass.cur_station.name1111111111111111111111111111111111111111111111'
# p trainone_pass.cur_station.name
p '000000000000000000000000 station1.list_train 00000000000000000000-'
puts
p station1.list_train.count
puts
p '000000000000000000000000 station1.list_train 00000000000000000000 P A S S E N G E R-'
puts
p station1.list_pass_train.count
puts
p '000000000000000000000000 station1.list_train 00000000000000000000- C A R G O -'
puts
p station1.list_cargo_train.count
puts
p '000000000000000000000000 station1.list_train 00000000000000000000-'
puts
trainone_pass.move_forward
p '000000000000000000000000 station1.list_train 00000000000000000000-'
traintwo_car.move_forward
p '000000000000000000000000 station1.list_train 00000000000000000000-'
p station1.list_train.count

#p 'trainone_pass.cur_station.name2222222222222222222222222222222222222222222222'
#p trainone_pass.cur_station.name


#p trainone_pass.forward_station.name
# p trainone_pass.previouse_station.name





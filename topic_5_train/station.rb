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
    passanger_trains = list_train.select { |train| train.class == PassengerTrain } 
    passanger_trains.count
  end

  def list_freight_train
    freight_trains = list_train.select { |train| train.class == CargoTrain } 
    freight_trains.count
  end
end

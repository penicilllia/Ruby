class Station 
  attr_reader :trains_on_station
  attr_reader :list_train, :name

  @@all_stations = []

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def initialize(name)
    @name = name
    @list_train = []
  end

  def add_train(train)
    @list_train.push(train)
  end

  def remove_train(train)
    @list_train.delete(train)
  end

  def list_pass_train
    @passanger_trains = list_train.select { |train| train.class == PassengerTrain } 
    @passanger_trains
  end

  def list_cargo_train
    @cargo_trains = list_train.select { |train| train.class == CargoTrain } 
    @cargo_trains
  end

  def list_train_name
    @list_train.each do |train|
      print train.name
      print ', '
    end
    puts
  end
end


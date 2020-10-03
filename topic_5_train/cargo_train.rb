class CargoTrain < Train
  attr_accessor :cargo_list
  def initialize(train_number, train_car_count)
    super
    @cargo_list = []
  end

  def add_car_carrige(carrige)
    if carrige.class == CargoCarrige
      @cargo_list << carrige
    end
  end

end
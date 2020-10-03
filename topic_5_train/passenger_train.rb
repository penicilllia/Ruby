class PassengerTrain < Train
  attr_accessor :passenger_list
  def initialize(train_number, train_car_count)
    super
    @passenger_list = []
  end

  def add_pas_carrige(carrige)
    if carrige.class == PasssengerCarrige
      @passenger_list << carrige
    end
  end

end
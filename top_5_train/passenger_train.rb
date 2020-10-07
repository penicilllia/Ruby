class PassengerTrain < Train
  attr_accessor :cargo_list
  def initialize(train_number)
    super
    @cargo_list = []
  end

  def add_carriage(carriage)
    if carriage.class == PassengerCarriage
      @cargo_list.push(carriage)
    else
      puts 'Неправильный тип вагона!'
    end
  end

  def del_carriage(carriage)
    if carriage.class == PassengerCarriage
      @cargo_list.delete(carriage)
    else
      puts 'Неправильный тип вагона!'
    end
  end

end

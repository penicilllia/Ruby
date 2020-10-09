class PassengerTrain < Train
  attr_reader :type
  def initialize(train_number)
    super
    @type = 'passenger'
  end

  def add_carriage(carriage)
    @cargo_list.push(carriage)
  end
end

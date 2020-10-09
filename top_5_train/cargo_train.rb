class CargoTrain < Train
  attr_reader :type
  def initialize(train_number)
    super
    @type = 'cargo'
  end

  def add_carriage(carriage)
    @cargo_list.push(carriage)
  end
end

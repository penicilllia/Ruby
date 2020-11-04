# frozen_string_literal: true

class CargoTrain < Train
  attr_reader :type
  def initialize(train_number)
    super
    @type = 'cargo'
  end
end

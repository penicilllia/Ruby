# frozen_string_literal: true

class PassengerTrain < Train
  attr_reader :type
  def initialize(train_number)
    super
    @type = 'passenger'
  end
end

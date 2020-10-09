require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :type
  def initialize(name)
    super
    @type = 'passenger'
  end
end

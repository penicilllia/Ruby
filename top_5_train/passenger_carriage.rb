require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_accessor :type
  def initialize(name)
    super
    @type = 'passenger'
  end
end

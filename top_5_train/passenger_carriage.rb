require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :type
  @type = 'passenger'
end

require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_reader :type
  @type = 'cargo'
end
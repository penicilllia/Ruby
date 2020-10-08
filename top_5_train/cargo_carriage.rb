require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_accessor :type
  def initialize(name)
    super
    @type = 'cargo'
  end
end
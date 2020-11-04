# frozen_string_literal: true

require_relative 'carriage.rb'
class CargoCarriage < Carriage
  attr_accessor :type, :free_volume, :occupied_volume
  def initialize(name, volume)
    super
    @type = 'cargo'
    @free_volume = volume
    @occupied_volume = 0
  end

  def take_volume(volume)
    @free_volume -= volume
    @occupied_volume += volume
  end
end

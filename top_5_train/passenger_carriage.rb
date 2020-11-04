# frozen_string_literal: true

require_relative 'carriage.rb'
class PassengerCarriage < Carriage
  attr_reader :type, :free_seats, :occupied_seats
  def initialize(name, volume)
    super
    @type = 'passenger'
    @free_seats = volume
    @occupied_seats = 0
  end

  def take_place
    @free_seats -= 1
    @occupied_seats += 1
  end
end

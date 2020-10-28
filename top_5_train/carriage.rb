require_relative 'module_company_name.rb'
require_relative 'module_instance_counter.rb'
class Carriage
  attr_accessor :name
  include CompanyName
  include InstanceCounter
  
  def initialize(name, volume)
    @name = name
    @volume = volume
    validate!
  end

  def validate!
    raise "Номер вагона нужно указать!" if @name.nil?
    raise "Номер вагона нужно обязательно указать!" if @name == ''
    raise "Укажие объем вагона" if @volume.nil?
  end
end
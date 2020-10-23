require_relative 'module_company_name.rb'
require_relative 'module_instance_counter.rb'
class Carriage
  attr_accessor :name
  include CompanyName
  include InstanceCounter
  
  def initialize(name)
    @name = name
    validate!
  end

  def validate!
    raise "Номер вагона нужно указать!" if @name.nil?
    raise "Номер вагона нужно обязательно указать!" if @name = ''
  end
end
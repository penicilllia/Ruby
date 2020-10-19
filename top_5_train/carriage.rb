require_relative 'module_company_name.rb'
require_relative 'module_instance_counter.rb'
class Carriage
  attr_accessor :name
  include CompanyName
  include InstanceCounter
  
  def initialize(name)
    @name = name
  end
end
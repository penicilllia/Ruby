require_relative 'module_company_name.rb'
class Carriage
  attr_accessor :name
  include CompanyName
  def initialize(name)
    @name = name
  end
end
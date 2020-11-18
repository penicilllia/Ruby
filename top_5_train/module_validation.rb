module Validation
  
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    attr_accessor :validates

    def validate(attr, type, *params)
      self.validates ||= []
      self.validates << { attr: attr, type: type, params: params }
      end
    end
    
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      validates = self.class.validates 
      validates.each do |validate|
        value = instance_variable_get("#{validate[:attr]}".to_sym)
        send("validate_#{validate[:type]}", value, *validate[:params])
      end
    end

    private 

    def validate_presence(value)
      raise "Значение атрибута не может быть пустым!" if !(value != nil && value != '')
    end
       
    def validate_type(value, params)
      raise "Значение атрибута не соответствует классу!" if !value.class == params
    end
       
    def validate_format(value, params)
      raise "Атрибут должен соответствовать формату!" if !params.match(value)
    end

  end
end

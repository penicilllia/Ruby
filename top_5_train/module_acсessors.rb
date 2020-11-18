
module Acсessors

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def attr_accessor_with_history(*names)
      history = []
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym
        self.instance_eval( 'var_name_history = Array.new')
        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}_history".to_sym) { puts var_name_history }
      
        define_method("#{name}=".to_sym) do |value| 
          instance_variable_set(var_name, value) 
          var_name_history << value
        end
      end
    end

    def strong_attr_accessor(name, atr_class)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value| 
        if atr_class == value.class 
          instance_variable_set(var_name, value) 
        else
          raise "Тип переменной должен быть #{atr_class}"
        end 
      end
    end
  end
end
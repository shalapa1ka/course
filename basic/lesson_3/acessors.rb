module Acessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "@#{name}_history".to_sym

        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          send("#{name}_history") << value
        end

        define_method("#{name}_history".to_sym) do
          instance_variable_get(var_name_history) ||
            instance_variable_set(var_name_history, [])
        end
      end
    end

    def strong_attr_accessor(name, klass)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise TypeError, "value is not #{klass}" unless value.is_a? klass

        instance_variable_set(var_name, value)
      end
    end
  end
end

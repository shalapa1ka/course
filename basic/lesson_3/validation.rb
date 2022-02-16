module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, val_type, option = nil)
      validate_hash[attr_name] ||= {}
      validate_hash[attr_name][val_type] = {
        option: option,
        err_msg: validate_error(val_type, attr_name)
      }
    end

    def validate_hash
      @validate_hash ||= {}
    end

    private

    def validate_error(val_type, attr)
      {
        presence: "#{attr} can't be empty",
        format: "#{attr} has invalid format",
        type: "#{attr} has invalid type"
      }[val_type]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validate_hash.each do |attr_name, values|
        values.each do |key, value|
          send("#{key}_validation", value[:err_msg], attr_name, value[:option])
        end
      end
      true
    end

    def valid?
      validate!
    # rescue StandardError
    #   false
    end

    protected

    def presence_validation(err, attr, option = nil)
      raise err if [nil, ''].include? attr
    end

    def format_validation(err, attr, option)
      raise err if send(attr) !~ option
    end

    def type_validation(err, attr, option)
      raise err unless send(attr).is_a? option
    end
  end
end

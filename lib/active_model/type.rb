require_relative 'type/value'
require_relative 'type/registry'
require_relative 'type/boolean'

module ActiveModel
  module Type
    @registry = Registry.new

    class << self
      attr_accessor :registry

      def register(type_name, klass = nil, **options, &block)
        registry.register(type_name, klass, **options, &block)
      end

      # def lookup(*args, **kwargs)
      #   registry.lookup(*args, **kwargs)
      # end
      #
      # def default_value
      #   @default_value ||= Value.new
      # end
    end

    register(:boolean, Type::Boolean)
  end
end

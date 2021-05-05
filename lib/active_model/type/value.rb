module ActiveModel
  module Type
    class Value
      def initialize(precision: nil, limit: nil, scale: nil)
        @precision = precision
        @limit = limit
        @scale = scale
      end

      def type
      end

      def cast(value)
        cast_value(value) unless value.nil?
      end

      def serealize(value) # :over wride:
        value
      end

      private

      def cast_value(value)
        value
      end
    end
  end
end

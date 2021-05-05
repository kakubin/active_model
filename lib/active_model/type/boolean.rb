require 'set'

module ActiveModel
  module Type
    class Boolean < Value # :nodoc:
      FALSE_VALUES = [false, 'false', 'FALSE', 0, '0'].to_set

      def type
        :boolean
      end

      def serialize(value)
        cast(value)
      end

      private

      def cast_value(value)
        if value == ''
          nil
        else
          !FALSE_VALUES.include?(value)
        end
      end
    end
  end
end

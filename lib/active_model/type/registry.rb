module ActiveModel
  module Type
    class Registry
      def initialize
        @registrations = []
      end

      def register(type_name, klass = nil, **options, &block)
        @block ||= proc { |_, *args| klass.new(*args) }
        registrations << registration_klass.new(type_name, block, **options)
      end

      private
      attr_reader :registrations

      def registration_klass
        Registration
      end
    end

    class Registration
      # optionsを受け取っておく
      # https://bugs.ruby-lang.org/issues/10856
      def initialize(name, block, **)
        @name = name
        @block = block
      end

      def call(_registry, *args, **kwargs)
        if kwargs.any?
          block.call(*args, **kwargs)
        else
          block.call(*args)
        end
      end

      private

      attr_reader :name, :block
    end
  end
end

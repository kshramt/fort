module Fort
  class Type
    class LogicalType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :sym

      def initialize(dim = 0)
        super
        @sym = 'l'
      end

      def to_s
        "Logical"
      end
    end
  end
end

module Fort
  class Type
    class ComplexType < ::Fort::Type::NumericType
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :kind, :kind_const

      def initialize(dim = 0, kind = 32)
        super
        @kind_const = "REAL#{@kind}"
      end
    end
  end
end

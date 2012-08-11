module Fort
  class Type
    class IntegerType < ::Fort::Type::NumericType
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      def initialize(dim = 0, kind = 32)
        super
        @kind_const = "INT#{@kind}"
      end
    end
  end
end

module Fort
  class Type
    class ComplexType < ::Fort::Type::NumericType
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      def kind_const(kind = self.kind)
        "REAL#{kind}"
      end
    end
  end
end

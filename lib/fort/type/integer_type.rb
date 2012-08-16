module Fort
  class Type
    class IntegerType < ::Fort::Type::NumericType
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      def kind_const(kind = self.kind)
        "INT#{kind}"
      end
    end
  end
end

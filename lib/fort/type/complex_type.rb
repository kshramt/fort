module Fort
  class Type
    class ComplexType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      KIND_SYM = {
        32 => 'S',              # Single
        64 => 'D',              # Double
        128 => 'Q',             # Quad
      }

      attr_reader :sym, :kind

      def initialize(dim = 0, kind = 32)
        super(dim)
        @kind = kind
        @sym = "z#{KIND_SYM[@kind]}"
      end

      def to_s
        @to_s ||= "Complex(REAL#{@kind})"
      end
    end
  end
end

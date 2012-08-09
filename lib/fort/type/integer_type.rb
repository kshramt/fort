module Fort
  class Type
    class IntegerType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      KIND_SYM = {
        8 => 'Hh',              # Harf-Harf
        16 => 'H',              # Harf
        32 => 'S',              # Single
        64 => 'D'               # Double
      }

      attr_reader :sym, :kind

      def initialize(dim = 0, kind = 32)
        super(dim)
        @kind = kind
        @sym = "i#{KIND_SYM[@kind]}"
      end

      def to_s
        @to_s ||= "Integer(INT#{@kind})"
      end
    end
  end
end

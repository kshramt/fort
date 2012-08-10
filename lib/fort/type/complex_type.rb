module Fort
  class Type
    class ComplexType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :kind

      def initialize(dim = 0, kind = 32)
        super(dim)
        @kind = kind
      end

      def to_s
        "#{super}Kind#{@kind}"
      end

      def declare
        "#{@stem}(REAL#{@kind})#{super}"
      end
    end
  end
end

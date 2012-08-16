module Fort
  class Type
    class NumericType < ::Fort::Type
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

      def declare(dim = self.dim, kind = self.kind)
        "#{self.type}(#{self.kind_const(kind)})#{super(dim)}"
      end
    end
  end
end

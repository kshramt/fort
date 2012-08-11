module Fort
  class Type
    class NumericType < ::Fort::Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :kind, :kind_const

      def initialize(dim = 0, kind = 32)
        super(dim)
        @kind = kind
        @kind_const = nil
      end

      def to_s
        "#{super}Kind#{@kind}"
      end

      def declare
        "#{@stem}(#{@kind_const})#{super}"
      end
    end
  end
end

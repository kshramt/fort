module Fort
  class Type
    class LogicalType < self
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      def initialize(dim = 0)
        super
      end

      def declare(dim = self.dim)
        "#{@type}#{super(dim)}"
      end
    end
  end
end

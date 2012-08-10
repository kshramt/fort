module Fort
  class Type
    class LogicalType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      def initialize(dim = 0)
        super
      end

      def declare
        "#{@stem}#{super}"
      end
    end
  end
end

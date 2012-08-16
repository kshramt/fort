module Fort
  class Type
    class CharacterType < self
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :len

      def initialize(dim = 0, len = 1)
        super(dim)
        @len = len
        @len_suf = case @len
                   when '*'
                     'Ast'
                   when ':'
                     'Colon'
                   else
                     @len
                   end
      end

      def to_s
        "#{super}Len#{@len_suf}"
      end

      def declare(dim = self.dim, len = @len)
        "#{self.type}(len = #{@len})#{super(dim)}"
      end
    end
  end
end

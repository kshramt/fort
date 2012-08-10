module Fort
  class Type
    class CharacterType < Type
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

      def declare
        "#{@stem}(len = #{@len})#{super}"
      end
    end
  end
end

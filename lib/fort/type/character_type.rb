module Fort
  class Type
    class CharacterType < Type
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      attr_reader :sym, :len

      def initialize(dim = 0, len = 1)
        super(dim)
        @len = len
        len_suffix = case @len
                     when '*'
                       'Ast'
                     when ':'
                       'Colon'
                     else
                       @len
                     end
        @sym = "c#{len_suffix}"
      end

      def to_s
        @to_s ||= "Character(len = #{@len})"
      end
    end
  end
end

module Fort
  class Src

    # Add Fortran source code specific utilities for String.
    class Code < String
      require 'pry'
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      # $1: quote, $2: string, $3: comment
      # We don't need $2 and $3
      STRING_OR_COMMENT_REG = /[^"'!]*(?:(["'])(.*?)\1|(!.*?)(?:\n|\z))/mi

      CONTINUATION_AMPERSAND_REG = /& *\n+ *&?/
      ONE_LINER_REG = /;/

      # $1: "program" or "module". $2: program or module name
      START_SECTION_REG = /\A(program|module) +([A-Za-z]\w*)\z/i
      END_SECTION_REG = /\Aend +(program|module) +([A-Za-z]\w*)\z/i

      # $1: "non_intrinsic" or "intrinsic" or nil. $2: module name
      USE_REG = /\Ause(?:(?: *, *((?:non_)?intrinsic) *:: *)| +)([A-Za-z]\w*)/i

      ParseError = Class.new(StandardError)

      # @return [Hash] Stored in @contents.
      #   {programs: {
      #       prog1: [
      #         {
      #           name: :mod1,
      #           intrinsic_mode: :both},
      #         {
      #           name: :mod2,
      #           intrinsic_mode: :intrinsic}]},
      #     modules: {
      #       mod2: [
      #         {
      #           name: :mod3,
      #           intrinsic_mode: :non_intrinsic}]}}
      def parse
        # Hash-Hash-Array-Hash => hhah
        hhah = Hash.new{|h, k|
          h[k] = Hash.new{|h, k|
            h[k] = Array.new{
              {}}}}

        mode = nil
        name = nil
        clean_code.each do |line|
          case line
          when START_SECTION_REG
            raise ParseError unless mode.nil? && name.nil?

            mode = low_sym($1)
            name = low_sym($2)
            hhah[mode][name] = []
            next
          when END_SECTION_REG
            raise ParseError unless low_sym($1) == mode && low_sym($2) == name

            mode = nil
            name = nil
            next
          end

          case mode
          when :program, :module
            next unless line =~ USE_REG

            hhah[mode][name] << {
              intrinsic_mode: if $1.nil? then :both else low_sym($1) end,
              name: low_sym($2)}
          end
        end

        hhah
      end

      def contents
        @contents ||= parse
      end

      # @return [Array] Lines without empty lines.
      def clean_code
        @clean_code ||= without_comments_and_strings\
          .without_continuation_ampersand\
          .without_one_line_semicolon\
          .split("\n")\
          .map(&:strip)\
          .delete_if(&:empty?)\
          .map(&:downcase)
      end

      def without_comments_and_strings()
        self.gsub(STRING_OR_COMMENT_REG) do |s|
          if $2
            s[STRING_OR_COMMENT_REG, 2] = ''
          elsif $3
            s[STRING_OR_COMMENT_REG, 3] = ''
          else
            raise MustNotHappen
          end

          s
        end
      end

      def without_continuation_ampersand()
        self.gsub(CONTINUATION_AMPERSAND_REG, '')
      end

      def without_one_line_semicolon()
        self.gsub(ONE_LINER_REG, "\n")
      end

      private

      def low_sym(str)
        str.downcase.to_sym
      end
    end
  end
end

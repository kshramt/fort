module Fort
  class Src

    # Add Fortran source code specific utilities for String.
    class Code < String
      require 'pry'
      require 'ruby_patch'
      extend ::RubyPatch::AutoLoad

      RETAINS = [
                 :normal,
                 :end_comment,
                 :start_single_quote_string,
                 :end_single_quote_string,
                 :start_double_quote_string,
                 :end_double_quote_string,
                ]
      CONTINUATION_AMPERSAND_REG = /& *\n+ *&?/
      ONE_LINER_REG = /;/

      # $1: "program" or "module". $2: program or module name
      START_SECTION_REG = /\A(program|module) +([A-Za-z]\w*)\z/i
      END_SECTION_REG = /\Aend +(program|module) +([A-Za-z]\w*)\z/i

      # $1: "non_intrinsic" or "intrinsic" or nil. $2: module name
      USE_REG = /\Ause(?:(?: *, *((?:non_)?intrinsic) *:: *)| +)([A-Za-z]\w*)/i

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
        @scanner = Scanner.new

        # Use << to keep instance variables etc of self.
        self.slice(0, 0) << self.each_char.select{|c|
          @scanner.__send__(Scanner::CHAR_KIND[c])
          RETAINS.include?(@scanner.state_name)}.join
      end

      def without_continuation_ampersand()
        self.gsub(CONTINUATION_AMPERSAND_REG, '')
      end

      def without_one_line_semicolon()
        self.gsub(ONE_LINER_REG, "\n")
      end
    end
  end
end

module Fort
  class Type
    require 'ruby_patch'
    extend ::RubyPatch::AutoLoad

    USE_ISO_FORTRAN_ENV = "use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128"

    attr_reader :dim, :stem

    def initialize(dim = 0)
      @dim = dim
      @stem = self.class.to_s.split('::').last.sub(/Type\z/, '')
    end

    def to_s
      "#{@stem}Dim#{dim}"
    end

    def declare
      if @dim >= 1
        ", dimension#{self.parenthesis}"
      else
        ""
      end
    end

    def colons
      ([':']*@dim).join(', ')
    end

    def parenthesis
      if @dim >= 1
        "(#{self.colons})"
      else
        ''
      end
    end

    def format
      "#{@dim}"
    end
  end
end

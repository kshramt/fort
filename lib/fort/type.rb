module Fort
  class Type
    require 'ruby_patch'
    extend ::RubyPatch::AutoLoad

    USE_ISO_FORTRAN_ENV = "use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128"

    attr_reader :type, :dim

    def initialize(dim = 0)
      @dim = dim
      @type = self.class.to_s.split('::').last.sub(/Type\z/, '')
    end

    def to_s
      "#{@type}Dim#{dim}"
    end

    def declare(dim = @dim)
      if dim >= 1
        ", dimension#{self.parenthesis(dim)}"
      else
        ""
      end
    end

    def colons(dim = @dim)
      ([':']*dim).join(', ')
    end

    def parenthesis(dim = @dim)
      if dim >= 1
        "(#{self.colons(dim)})"
      else
        ''
      end
    end
  end
end

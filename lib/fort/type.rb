module Fort
  class Type
    require 'ruby_patch'
    extend ::RubyPatch::AutoLoad

    USE_ISO_FORTRAN_ENV = "use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128"

    attr_reader :dim

    def initialize(dim = 0)
      @dim = dim
    end

    def colons
      @colons ||= ([':']*@dim).join(', ')
    end

    def parenthesis
      @parenthesis ||= if @dim >= 1
                         "(#{self.colons})"
                       else
                         ''
                       end
    end

    def suf
      @suf ||= "_#{self.sym}_#{@dim}"
    end
  end
end

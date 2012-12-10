module Fort
end
module ::Fort::Type
  USE_ISO_FORTRAN_ENV = "use, intrinsic:: iso_fortran_env, only: INT8, INT16, INT32, INT64, REAL32, REAL64, REAL128"

  module Providable
    ID_GENERATOR = lambda{
      id_number = '0'
      lambda{'T' + id_number.next!}}.call

    def provide(hash)
      @memo ||= {}
      @memo[hash] ||= new(::Fort::Type::Providable::ID_GENERATOR.call, hash)
    end
  end

  class Base
    extend Providable

    def initialize(id, hash)
      @id = id
      @dim = hash.fetch(:dim)
      raise ArgumentError, "@dim: #{@dim}" if @dim < 0
      @type = self.class.to_s.split('::').last
    end
    attr_reader :id, :dim, :type

    def to_s
      "#{@type}Dim#{@dim}"
    end

    def declare
      @type + dimension()
    end

    def parenthesis
      if @dim >= 1
        "(" + colons() + ")"
      else
        ''
      end
    end

    private

    def dimension
      if @dim >= 1
        ", dimension" + parenthesis()
      else
        ''
      end
    end

    def colons
      if @dim >= 1
        ([':']*@dim).join(', ')
      end
    end
  end

  class Numeric < Base
    def initialize(id, hash)
      super
      @kind = hash.fetch(:kind)
    end
    attr_reader :kind

    def to_s
      super + "Kind#{@kind}"
    end

    def declare
      "#{@type}(kind = #{@kind})#{dimension()}"
    end
  end

  class Integer < Numeric
    KINDS = [:INT8, :INT16, :INT32, :INT64]

    def initialize(id, hash)
      super
      @kind = hash.fetch(:kind)
    end
    attr_reader :kind
  end

  class Real < Numeric
    KINDS = [:REAL32, :REAL64, :REAL128]

    def initialize(id, hash)
      super
      @kind = hash.fetch(:kind)
    end
    attr_reader :kind
  end

  class Complex < Numeric
    KINDS = [:REAL32, :REAL64, :REAL128]

    def initialize(id, hash)
      super
      @kind = hash.fetch(:kind)
    end
    attr_reader :kind
  end

  class Character < Base
    def initialize(id, hash)
      super
      @len = hash.fetch(:len)
    end
    attr_reader :len

    def to_s
      super + "Len#{@len}"
    end

    def declare
      "#{@type}(len = #{@len})#{dimension()}"
    end
  end

  class Logical < Base
    def initialize(id, hash)
      super
    end
  end
end

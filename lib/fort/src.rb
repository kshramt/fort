module Fort

  # Handle file related informations.
  class Src
    require 'pathname'
    require 'ruby_patch'
    extend ::RubyPatch::AutoLoad

    attr_reader :path

    def initialize(path)
      @path = Pathname.new(path).expand_path
    end

    def code
      @code ||= Code.new(@path.read)
    end
  end
end

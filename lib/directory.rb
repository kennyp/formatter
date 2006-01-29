module Format
  # Defines a dirctory to be processed by the give block.
  class Directory
    attr_accessor :dirname
    def initialize(dirname = '.', &blk)
      @dirname = dirname
      self.process(@dirname, &blk)
    end
    def process(dirname, &blk)
      Dir.foreach(dirname) do |file|
        yield(file)
      end
    end
  end
end
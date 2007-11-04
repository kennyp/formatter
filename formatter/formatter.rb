require 'formatter/grammar'

class Formatter
	attr_accessor :grammar, :file, :file_name
	def initialize(file, grammar)
        @file_name = file
		@grammar = Grammar.new(grammar)
	end
	
	def run
	    @file = File.read(@file_name)
    end
end


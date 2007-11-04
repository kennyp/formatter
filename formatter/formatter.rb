require 'grammer'

class Formatter
	attr_accessor :grammar
	def initialize(grammar)
		@grammar = Grammer.new(grammar)
	end
end

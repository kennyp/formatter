require 'formatter/grammar'

class Formatter
	attr_accessor :grammar
	def initialize(grammar)
		@grammar = Grammar.new(grammar)
	end
end

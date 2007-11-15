# Project Formatter
# 
# Author::  Adam Wagner (mailto:awagner83@gmail.com)
# Author::  Kenneth Parnell

require 'formatter/tokenized_string'

# Formatter Grammar Class
# Reads language grammar files and is used as a set of rules of tokenization

class Grammar
    def initialize(grammar)
        @grammar_file = grammar
        @tokenizer = {}
		@rules = Array.new()
    end
    
    def valid?
    	# ensure grammar is loaded
    	load_grammar if @tokenizer.size.zero?
		
		@tokenizer.each() do |token|
			return false if token.size.zero?
		end
    end
	
	def has_rules?
		@rules.length() > 0
	end
    
    def load_grammar
    	@tokenizer = YAML.load_file( @grammar_file )
        @tokenizer.size
    end
    
    def tokenize(string)
    	TokenizedString.new(string)
    end
end

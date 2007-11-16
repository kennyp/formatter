# Project Formatter
# 
# Author::  Adam Wagner (mailto:awagner83@gmail.com)
# Author::  Kenneth Parnell

require 'formatter/tokenized_string'

# Formatter Grammar Class
# Reads language grammar files and is used as a set of rules of tokenization
class Grammar
	
	# Setup grammar instance
    def initialize(grammar)
        @grammar_file = grammar
        @tokenizer = {}
		@rules = Array.new()
    end
    
	# Ensure grammar_file is proper YAML has the necessary elements 
	# to make a valid grammar
    def valid?
    	# ensure grammar is loaded
    	load_grammar if @tokenizer.size.zero?
		
		# ensure each grammar rule is properly formed
		@tokenizer.each_value do |token|
			return false if token.size.zero? or not token.has_key? 'regex'
			return false if token.has_key? 'rules' and token['rules'].size.zero?
		end
		
		return true;
    end
    
    def load_grammar
    	@tokenizer = YAML.load_file( @grammar_file )
        @tokenizer.size
    end
    
    def tokenize(string)
    	TokenizedString.new(string)
    end
end

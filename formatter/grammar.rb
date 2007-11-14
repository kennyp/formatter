require 'formatter/tokenized_string'

class Grammar
    def initialize(grammar)
        @grammar_file = grammar
        @tokenizer = {}
		@rules = Array.new()
    end
    
    def valid?
        @valid ||= load_grammar
    end
	
	def has_rules?
		@rules.length() > 0
	end
    
    def load_grammar
        File.open(@grammar_file, 'r') do |f|
            f.each_line do |l|
                t = l.split(/\s+/)
                @tokenizer[t[0]] = t[1]
            end
        end
        @tokenizer.size
    end
    
    def tokenize(string)
    	TokenizedString.new(string)
    end
end

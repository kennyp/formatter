class Grammar
    def initialize(grammar)
        @grammar_file = grammar
        @tokenizer = {}
    end
    
    def valid?
        @valid ||= load_grammar
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
    
    def tokenize(file)
        TokenizedString.new(file)
    end
end

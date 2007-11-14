require 'formatter/grammar'

describe Grammar, " when initialized" do
	before(:each) do
		@grammar = Grammar.new('spec/test.gram')
	end
	
    it "should have a valid grammar" do
        @grammar.should be_valid
    end
end

describe Grammar, " when passed a string to tokenize" do
    before(:each) do
        @grammar = Grammar.new('spec/test.gram')
        @string = <<-EOF
            (defun (square x)
                (* x x))
        EOF
	end
	
    it "should return a tokenized string" do
		@grammar.tokenize(@string).should_not equal({})
    end
end 


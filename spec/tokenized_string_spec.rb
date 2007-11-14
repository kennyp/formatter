require 'formatter/tokenized_string'

describe TokenizedString, " when initialized" do
	before(:each) do
		@tokenized_string = TokenizedString.new( "new string" )
	end
	
	it "should have a valid string to tokenize" do
		@tokenized_string.should be_valid
	end
end

describe TokenizedString, " when definition is added" do
    before(:each) do
        @tokenized_string = TokenizedString.new( "new string" )
    end
	
	it "should have more definations than before"
end

describe TokenizedString, " when string is tokenized" do
	before(:each) do
		@tokenized_string = TokenizedString.new( "new string" )
	end
	
	it "should have tokens"
end
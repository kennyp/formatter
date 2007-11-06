require 'formatter/tokenized_string'

describe TokenizedString, " when initialized" do
	before(:each) do
		@tokenized_string = TokenizedString.new( "new string" )
	end
	
	it "should have a valid string to tokenize" do
		@tokenized_string.should be_valid
	end
end
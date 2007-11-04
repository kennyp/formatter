require 'formatter/formatter'

describe Formatter, " when initialized" do
	before(:each) do
		@formatter = Formatter.new('libraries/c.gram')
	end

	it "should have a grammar" do
		@formatter.grammar.should_not be_nil
	end

	it "should have a valid grammar" do
		@formatter.grammar.should be_valid
	end
end

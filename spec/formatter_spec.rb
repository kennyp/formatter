require 'formatter/formatter'

describe Formatter, " when initialized" do
	before(:each) do
		@formatter = Formatter.new('spec/test.file', 'spec/test.gram')
	end

	it "should have a grammar" do
		@formatter.grammar.should_not be_nil
	end
	
	it "should have a file to parse" do
        @formatter.file_name.should_not be_nil
    end
end

describe Formatter, " when run" do
    before(:each) do
		@formatter = Formatter.new('spec/test.file', 'spec/test.gram')
		@formatter.run
	end
	
    it "should have legitimate file to parse" do
        @formatter.file.should_not be_nil
    end
end


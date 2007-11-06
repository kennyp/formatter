require 'formatter/token'

class TokenizedString
	attr_accessor :string
	
	def initialize(string)
		@string = string
	end
	
	def valid?
		! @string.empty?
	end
end
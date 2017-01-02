require 'zipfy'
module Zipfy
	class WordData

		attr_accessor :word
		attr_accessor :freqency
		attr_accessor :zip_number # theoretically equal to 1/rank in a text
	end

	def initialize word, frequency = 1
		@word = word
		@freqency = frequency
	end
end
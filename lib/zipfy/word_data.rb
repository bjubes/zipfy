module Zipfy
	class WordData

		attr_accessor :word
		attr_accessor :frequency
		attr_accessor :zip_number # theoretically equal to 1/rank in a text

		def initialize word, frequency = 1
			@word = word
			@frequency = frequency
		end
	end
end
require 'test_helper'
require 'zipfy'
require 'zipfy/version'

begin #dev optional gems
require 'pry'
rescue LoadError
    STDERR.puts "some dev deps not installed .. ignoring"
    #probably a travis or non-dev build
end

include Zipfy

class ZipfyTest < Minitest::Test
	def setup
		@z = Zipf.new
	end

	def test_that_it_has_a_version_number
		refute_nil ::Zipfy::VERSION
	end

	def test_distribution_is_unique
		words = "the it the the it and yet for nor not for for-got".split(" ")
		@z.create_distribution words
		words_arr = []
		@z.distribution.each {|d| words_arr << d.word}
		assert(true, words_arr === words.uniq)
	end

	def test_zipf_constant_for_one_word_is_one
		@z.create_distribution ["test"]
		@z.calculate_zipfness
		assert_equal 1,  @z.zipf_constant
		assert_equal 0, @z.calculate_std_dev_from_reg
	end

	def test_zipf_constant_for_two_words_is_two
		@z.create_distribution ["test", "123"]
		@z.calculate_zipf_constant
		assert_equal 2,  @z.zipf_constant

	end

	def test_zipf_consant_for_random_uniq_array
		random_words = []
		rand(3..15).times {random_words << ('a'..'z').to_a.shuffle[0..8].join}
		@z.create_distribution random_words.uniq
		@z.calculate_zipf_constant
		assert_equal random_words.uniq.length, @z.zipf_constant
	end
	
	def test_std_reg_with_simple_set
			@z.create_distribution "a a a b c".split(" ") #missing a "b" to make this perfect
			@z.calculate_zipfness
			#out of a set of 3, b is deviating by 1, so its zipf dev is 1/2 - 1/3
			# (1/2 - 1/3) / 3 = 1/18
			assert_in_delta (1/18.to_f), @z.calculate_std_dev_from_reg, 0.00001
	end
	


end
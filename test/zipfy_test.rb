require 'test_helper'
require 'zipfy'
require 'zipfy/version'

require 'pry'
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
		assert_equal(@z.distribution.keys, words.uniq)
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


end
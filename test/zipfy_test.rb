require 'test_helper'
require 'zipfy'
include Zipfy

class ZipfyTest < Minitest::Test
	def test_that_it_has_a_version_number
		refute_nil ::Zipfy::VERSION
	end

	def test_distribution_is_unique
		words = "the it the the it and yet for nor not for for-got".split(" ")
		z = Zipf.new
		z.create_distribution
		assert_equal(z.distribution, words.uniq)
	end
end

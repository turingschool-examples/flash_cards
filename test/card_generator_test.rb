require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'minitest/autorun'
require 'minitest/pride'
require "pry"

class CardGeneratorTest < Minitest::Test

def test_it_can_read_a_file
    @filename = "cards.txt"
    @cards = CardGenerator.new(filename).cards

    assert_equal
  end
  binding.pry
end

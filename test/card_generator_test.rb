require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    cards = CardGenerator.new(filename).cards

    assert_instance_of CardGenerator, cards
  end
end

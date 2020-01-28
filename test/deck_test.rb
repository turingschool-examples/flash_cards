require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end
end

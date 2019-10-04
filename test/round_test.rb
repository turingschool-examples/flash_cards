require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def test_if_there_is_a_deck

  assert_instance_of Deck, @deck
end

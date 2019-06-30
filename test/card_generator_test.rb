require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'
require 'pry'

class CardGeneratorTest < Minitest::Test


  def test_card_generate
    deck = CardGenerator.new("cards.txt").cards

    assert_instance_of Card, deck.first
  end

end

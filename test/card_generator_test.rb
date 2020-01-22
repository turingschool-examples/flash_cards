require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'
require './lib/card.rb'
require './lib/deck.rb'

class CardGeneratorTest < Minitest::Test

  def test_it_generates_cards_from_txt_file
    cards = CardGenerator.new('./lib/cards.txt')
    deck = Deck.new(cards)

    assert_equal deck.cards, cards
  end

end

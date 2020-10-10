require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/deck'
require './lib/card'
require './lib/round'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end

  def test_it_can_create_array_of_strings_from_card_data
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_equal [
                   "What is 5 + 5?,10,STEM",
                   "What is Rachel's favorite animal?,red panda,Turing Staff",
                   "What is Mike's middle name?,nobody knows,Turing Staff",
                   "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"
                 ], cards.process_cards_file
  end

  def test_card_gen_cards_method_can_create_a_deck_of_cards_from_text_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    cards.cards
    assert_instance_of Deck, cards.deck
    assert_equal 4, cards.deck.cards.length
    assert_instance_of Card, cards.deck.cards[0]
  end
end

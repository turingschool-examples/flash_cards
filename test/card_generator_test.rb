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
                   "What is the capital of Alaska?,Juneau,Geography",
                   "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?,Mars,Astronomy",
                   "Describe in words the exact direction that is 697.5° clockwise from due north?,North north west,STEM",
                   "What is a group of jelly fish called?,Smack,Animals",
                   "Polar Bears mainly feed on what animals?,Seals,Animals",
                   "How many digits of pi are there?,Infinity,Math",
                   "What is the largest internal organ of the human body?,Liver,Anatomy",
                   "Which bone is the longest bone in the human body?,Femur,Anatomy",
                   "Whats the world's largest ocean?,Pacific,Geography",
                   "What is the largest animal on Earth?,Blue Whale,Animals"
                 ], cards.process_cards_file
  end

  def test_card_gen_cards_method_can_create_a_deck_of_cards_from_text_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    cards.cards
    assert_instance_of Deck, cards.deck
    assert_equal 10, cards.deck.cards.length
    assert_instance_of Card, cards.deck.cards[0]
  end
end

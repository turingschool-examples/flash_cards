require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'
require 'pry'
class DeskTest < MiniTest::Test
  def test_card_1
    # skip
    card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    assert_instance_of Card, card_1
  end
  def test_card_2
    # skip
    card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
    assert_instance_of Card, card_2
  end
  def test_card_3
    # skip
    card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
    assert_instance_of Card, card_3
  end
  def test_deck_count
     card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
     card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
     card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
     card_4 = Card.new("What is my sons Favorite Movie?", "Iron Giant", :Trivia)
     cards = [card_1, card_2, card_3, card_4]
     deck = Deck.new(cards)
     require "pry"; binding.pry
    assert_equal 4, cards.count
    assert_equal card_3.category, deck_1.cards_in_category(card_1.category).first.category
    assert_equal 3, deck_1.cards_in_category(:Vocabulary).count
  end
end

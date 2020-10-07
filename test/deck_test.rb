require 'minitest/autorun'
require './lib/deck'
require './lib/card'

class DeckTest < MiniTest::Test

  # Corrects

  def test_deck_instantiation
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_deck_cards_attr
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal [card_1, card_2, card_3], deck.cards
    deck.cards.shift
    assert_equal [card_2, card_3], deck.cards
  end

  def test_deck_count
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_deck_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal [card_2, card_3], deck.cards_in_category(:STEM)
  end

  # Incorrects

  def test_deck_incorrect_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    refute_equal [card_2, card_3], deck.cards_in_category(:Geography)
  end

  def test_deck_count
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
      reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° cloc
      kwise from due north?", "North north west", :STEM)
    card_4 = Card.new("What is the proper name for tradition Japanese tattoos?",
       "Horimono", :Interest)
    cards = [card_1, card_2, card_3, card_4]
    deck = Deck.new(cards)

    refute_equal 3, deck.count
  end

end

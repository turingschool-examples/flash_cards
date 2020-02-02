require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_has_deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_turns_taken
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal [], round.turns

    new_turn = round.take_turn("Juneau")

    assert_equal [new_turn], round.turns
  end

  def test_show_current_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal card1, round.current_card

    round.take_turn("Juneau")
    assert_equal card2, round.current_card

    round.take_turn("Venus")
    assert_equal card3, round.current_card
  end

  def test_number_of_turns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 2, round.turns.size
  end

  def test_show_number_of_correct_guesses
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")

    assert_equal 1, round.number_correct

    round.take_turn("Juneau")
    assert_equal 1, round.number_correct

    round.take_turn("North north west")
    assert_equal 2, round.number_correct
  end

  def test_number_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)

    round.take_turn("North north west")
    assert_equal 1, round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct

    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card4 = Card.new("What is the capital of Texas?", "Austin", :Geography)
    card5 = Card.new("What is my name?", "Something", :Students)
    card6 = Card.new("What is my name?", "Something", :Students)
    card7 = Card.new("What is my name?", "Something", :Students)
    card8 = Card.new("What is my name?", "Something", :Students)
    card9 = Card.new("What is my name?", "Something", :Students)

    #checking for long decimals (ex: 4/9 = 0.44444444444)
    deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("North north west")
    round.take_turn("Austin")
    round.take_turn("Idk")
    round.take_turn("Idk")
    round.take_turn("Idk")
    round.take_turn("Idk")
    round.take_turn("Idk")

    assert_equal 44.44, round.percent_correct
  end

  def test_percent_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

end

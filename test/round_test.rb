require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_can_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_turns_method_returns_empty_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    assert_equal [], round.turns
  end

  def test_current_card_method_returns_top_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_take_turn_method_creates_a_new_Turn_class_object
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_correct_method_returns_true_for_correct_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert new_turn.correct?
  end

  # pry(main)> round.turns
  # #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
  #
  # pry(main)> round.number_correct
  # #=> 1
  #
  # pry(main)> round.current_card
  # #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
  #
  # pry(main)> round.take_turn("Venus")
  # #=> #<Turn:0x00007f972a215b38...>
  #
  # pry(main)> round.turns.count
  # #=> 2
  #
  # pry(main)> round.turns.last.feedback
  # #=> "Incorrect."
  #
  # pry(main)> round.number_correct
  # #=> 1
  #
  # pry(main)> round.number_correct_by_category(:Geography)
  # #=> 1
  #
  # pry(main)> round.number_correct_by_category(:STEM)
  # #=> 0
  #
  # pry(main)> round.percent_correct
  # #=> 50.0
  #
  # pry(main)> round.percent_correct_by_category(:Geography)
  # #=> 100.0
  #
  # pry(main)> round.current_card
  # #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
end

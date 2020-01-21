require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'


class RoundTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_keeps_track_of_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_it_can_identify_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal card_1, round.current_card
    end

    def test_when_it_takes_turn_a_new_turn_object_is_created
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      assert_equal Turn, new_turn.class
    end

    def test_when_it_takes_turn_the_turn_is_added_to_turns_attribute
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      assert_equal new_turn, round.turns[0]
    end

    def test_take_turn_records_number_of_correct_answers
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      new_turn = round.take_turn("Juneau")

      assert_equal 1, round.number_correct
    end

    def test_take_turn_changes_current_card
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      turn_1 = round.take_turn("Juneau")

      assert_equal card_2, round.current_card
    end

    def test_it_can_track_number_correct_by_category
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      turn_1 = round.take_turn("Juneau")
      turn_2 = round.take_turn("Pluto")

      assert_equal 1, round.number_correct_by_category(:Geography)
      assert_equal 0, round.number_correct_by_category(:STEM)
    end

    def test_it_can_calculate_percent_correct
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      cards = [card_1, card_2, card_3]

      deck = Deck.new(cards)

      round = Round.new(deck)

      turn_1 = round.take_turn("Juneau")
      turn_2 = round.take_turn("Pluto")

      assert_equal 50.0, round.percent_correct
      assert_equal 100.0, round.percent_correct_by_category(:Geography)
    end

end

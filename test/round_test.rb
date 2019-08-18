require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

    def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    def test_it_exists
        assert_instance_of Round, @round
    end

    def test_it_has_a_deck
        assert_equal @deck, @round.deck
    end

    def test_user_can_take_a_turn
        turn_1 = @round.take_turn("Juneau")

        assert_instance_of Turn, turn_1
    end

    def test_turns_is_empty_at_start_of_round
        assert_equal [], @round.turns
    end

    def test_turns_are_stored_and_returned
        turn_1 = @round.take_turn("Juneau")
        turn_2 = @round.take_turn("Jupiter")

        assert_equal [turn_1, turn_2], @round.turns
    end

    def test_current_card_is_returned
        assert_equal @card_1, @round.current_card

        turn_1 = @round.take_turn("Juneau")
        assert_equal @card_2, @round.current_card

        turn_2 = @round.take_turn("Jupiter")
        assert_equal @card_3, @round.current_card

        turn_3 = @round.take_turn("North north west")
        assert_nil @round.current_card
    end

    def test_number_of_correct_guesses
        turn_1 = @round.take_turn("Juneau")
        turn_2 = @round.take_turn("Jupiter")
        turn_3 = @round.take_turn("North north west")

        assert_equal 2, @round.number_correct
    end

    def test_number_of_correct_guesses_by_category
        turn_1 = @round.take_turn("Juneau")
        turn_2 = @round.take_turn("Jupiter")
        turn_3 = @round.take_turn("North north west")

        assert_equal 1, @round.number_correct_by_category(:Geography)
        assert_equal 1, @round.number_correct_by_category(:STEM)
        assert_equal 0, @round.number_correct_by_category("Pop Culture")
    end

    def test_overall_percent_correct
        turn_1 = @round.take_turn("Juneau")
        turn_2 = @round.take_turn("Jupiter")
        turn_3 = @round.take_turn("North north west")

        assert_in_delta 66.6666666, @round.percent_correct, 0.0001
    end

    def test_percent_correct_by_category
        turn_1 = @round.take_turn("Juneau")
        turn_2 = @round.take_turn("Jupiter")
        turn_3 = @round.take_turn("North north west")

        assert_equal 100.0, @round.percent_correct_by_category(:Geography)
        assert_equal 50.0, @round.percent_correct_by_category(:STEM)
        assert_equal 0.0, @round.percent_correct_by_category("Pop Culture")
    end
end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
    
    def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

    def test_class_is_initialized

        assert_equal @deck, @round.deck
        assert_equal [], @round.turns
    end

    def test_can_read_current_card

        assert_equal @card_1, @round.current_card
    end
    
    def test_can_take_new_turn
        new_turn = @round.take_turn("Juneau")

        assert_equal Turn, new_turn.class
    end

    def test_can_make_guess
        new_turn = @round.take_turn("Juneau")
        
        assert_equal "Juneau", new_turn.guess
        assert_equal true, new_turn.correct?
        assert_equal 1, @round.number_correct
    end
 
    def test_card_changes_after_turn
        new_turn = @round.take_turn("Juneau")

        assert_equal @card_2, @round.current_card
    end

    def test_can_take_multiple_turns
        new_turn = @round.take_turn("Juneau")
        @round.take_turn("Venus")

        assert_equal 2, @round.turns.count
    end

    def test_can_make_incorrect_guesses
        new_turn = @round.take_turn("Juneau")
        @round.take_turn("Venus")

        assert_equal "Incorrect.", @round.turns.last.feedback
        assert_equal 1, @round.number_correct
    end

    def test_can_tally_and_calculate_percentages_by_category
        new_turn = @round.take_turn("Juneau")
        @round.take_turn("Venus")

        assert_equal 1, @round.number_correct_by_category(:Geography)
        assert_equal 0, @round.number_correct_by_category(:STEM)
        assert_equal 50, @round.percent_correct
        assert_equal 100, @round.percent_correct_by_category(:Geography)
    end
end
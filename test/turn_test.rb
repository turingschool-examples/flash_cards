require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class TurnTest < Minitest::Test
    def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
      end

    def test_it_exists
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
    
        assert_instance_of Turn, turn
    end

    def test_it_can_say_guess
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        assert_equal "Juneau" , turn.guess
    end

    def test_it_can_respond_if_guess_was_correct
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        
        turn.correct?
      
    

        assert_equal true ,  turn.correct?
        
    end

    def test_it_can_give_feedback_on_result_of_guess
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        turn2 = Turn.new("Denver", card)

        assert_equal "Correct!", turn.feedback
        assert_equal "Incorrect.", turn2.feedback
        
    end

    def test_it_can_handle_an_incorrect_guess
        @round.take_turn("Venus")


        assert_equal "Incorrect.", @round.turns.last.feedback
    end

    def test_it_can_calc_number_correct_by_category
        @round.take_turn("Juneau")


        assert_equal 1, @round.number_correct_by_category(:Geography)
    end

    def test__it_can_calc_percent_correct
        @round.take_turn("Juneau")
        @round.take_turn("Venus")


        assert_equal 50.0, @round.percent_correct
    end


    def test_it_percent_correct_by_category
        @round.take_turn("Juneau")
        @round.take_turn("Mars")
        @round.take_turn("North north west")
        binding.pry

        assert_equal 100.0, @round.percent_correct_by_category(:Geography)
        assert_equal 100.0, @round.percent_correct_by_category(:STEM)
        assert_equal @card_3, @round.current_card
    end
end
require 'minitest/autorun'
require './lib/card'
require './lib/turn'
require './lib/deck'
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

    def test_it_exists

        assert_instance_of Round, @round
        assert_equal [] , @round.turns
    end

    def test_it_can_say_the_first_card
        #binding.pry
        
        assert_equal @card_1 , @round.first_card

    end

    def test_it_can_create_turn_objects
        
        new_turn = @round.take_turn("Juneau")

        assert_equal Turn , new_turn.class
    end
    
    def test_it_can_handle_a_guess
        
        new_turn = @round.take_turn("Juneau")
      
        assert_equal "Juneau" , new_turn.guess
        assert_equal true , new_turn.correct?
        assert_equal 1 , @round.number_correct
    end

    def test_it_iterate_through_cards_array
        
        new_turn = @round.take_turn("Juneau")

        assert_equal @card_2 , @round.current_card
    end

    def test_it_can_handle_multiple_guesses
        
        new_turn = @round.take_turn("Juneau")

        @round.take_turn("Saturn")
        
        assert_equal 2 , @round.turns.count
    end

    def test_it_can_handle_incorrect_guesses
        @round.take_turn("Denver")

        assert_equal "Incorrect." , @round.turns.last.feedback
    end


    def test_it_can_count_correct_categories
        @round.take_turn("Juneau")
       
        assert_equal 1 , @round.number_correct_by_category(:Geography)
    end 

    def test_it_can_calculate_percentages
        @round.take_turn("Juneau")
        @round.take_turn("Denver")
       
        assert_equal 50.0 , @round.percent_correct
    end

    def test_it_can_calculate_category_percentages
        @round.take_turn("Juneau")
       # @round.take_turn("Mars")

        assert_equal 100.0 , @round.percent_correct_by_category(:Geography)
    end


end
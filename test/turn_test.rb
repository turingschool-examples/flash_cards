require 'minitest/autorun'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test
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
        assert_equal "Incorrect!", turn2.feedback
        
    end
end
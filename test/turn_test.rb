require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

    def setup
        @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @turn_1 = Turn.new("Saturn", @card)
        @turn_2 = Turn.new("Mercury", @card)
        @turn_3 = Turn.new("MErCurY", @card)
    end

    def test_it_exists
        assert_instance_of Turn, @turn_1
    end

    def test_it_has_a_card
        assert_equal @card, @turn_1.card
    end

    def test_it_has_a_guess
        assert_equal "Saturn", @turn_1.guess
    end

    def test_correct_method_returns_boolean
        refute @turn_1.correct?
        assert @turn_2.correct?
    end

    def test_correct_method_is_case_insensitive
        assert @turn_3.correct?
    end

    def test_feedback_method_returns_string
        assert_equal "Incorrect.", @turn_1.feedback
        assert_equal "Correct!", @turn_2.feedback
    end

end

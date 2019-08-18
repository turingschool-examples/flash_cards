require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

    def setup
        @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @turn_wrong = Turn.new("Saturn", @card)
        @turn_right = Turn.new("Mercury", @card)
        @turn_case = Turn.new("MErCurY", @card)
    end

    def test_it_exists
        assert_instance_of Turn, @turn_wrong
    end

    def test_it_has_a_card
        assert_equal @card, @turn_wrong.card
    end

    def test_it_has_a_guess
        assert_equal "Saturn", @turn_wrong.guess
    end

    def test_correct_method_returns_boolean
        refute @turn_wrong.correct?
        assert @turn_right.correct?
    end

    def test_correct_method_is_case_insensitive
        assert @turn_case.correct?
    end

    def test_feedback_method_returns_string
        assert_equal "Incorrect.", @turn_wrong.feedback
        assert_equal "Correct!", @turn_right.feedback
    end

end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_turn_has_a_card
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      assert_equal card, turn.card
    end

    def test_turn_has_an_guess
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        assert_equal "Juneau", turn.guess
      end

      def test_turn_is_correct
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        assert_equal true, turn.correct?
      end


      def test_turn_feedback_returns_correct_when_correct
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        assert_equal "Correct!", turn.feedback
      end

      def test_correct_returns_false_when_incorrect
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        assert_equal false, turn.correct?
      end

      def test_feedback_returns_incorrect_when_incorrect
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        assert_equal "Incorrect.", turn.feedback
      end

    end

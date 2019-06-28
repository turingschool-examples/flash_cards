require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_turn_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card

  end
    def test_if_guess_exist
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      turn = Turn.new("Juneau", card)
      assert_equal "Juneau", turn.guess
    end

    def test_turn_correct

      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      assert_equal true, turn.correct?
      end

      def test_gives_feedback
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        assert_equal "Correct!", turn.feedback

        card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn_2 = Turn.new("Saturn", card_2)

        assert_equal "Incorrect!", turn_2.feedback

        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        turn_3 = Turn.new("Mars" ,card )

        assert_equal "Correct!", turn.feedback

      end


end

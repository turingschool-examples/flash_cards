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
        turn_2 = Turn.new("denver", card)
        assert_equal "Correct!", turn.feedback
        assert_equal "WORNG!", turn_2.feedback

      end


end

#pry(main)> turn.feedback
#=> "Correct!"

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

    # new_turn = @round.take_turn("Juneau")
  end

  # test Round exists
  def test_it_exists_round

    assert_instance_of Round, @round
  end

  # test my deck is correct
  def test_deck

    assert_equal @deck, @round.deck
  end

   def test_turns

     assert_equal [], @round.turns
   end

  # test the current card is the top card of the deck
  def test_current_card

    assert_equal @deck.cards[0], @round.current_card
  end

  def test_take_turn
    @round.take_turn("Juneau")

    assert_equal @round.current_card, @card_2
  end

  def test_new_turn_class
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_new_turn_correct?
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_turns
    new_turn = @round.take_turn("Juneau")

    assert_equal new_turn, @round.turns[0]
  end

  def test_number_correct
     @round.take_turn("Juneau")

     assert_equal 1, @round.number_correct
  end

  def test_round_current_card_2

    assert_equal @deck.cards[0], @round.current_card
  end

  def test_round_take_turn_2
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal new_turn, @round.turns[0]
  end

  def test_round_turns_count_2
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  # Apparently we don't have to test this... per megan per tyler
  # def test_turns_count_feedback
  #
  #   assert_equal "Incorrect.", @round.turns.last.feedback
  # end

  def test_round_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_2
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end

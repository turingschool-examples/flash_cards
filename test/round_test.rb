require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The beaver is the national emblem of what country?", "Canada", :Geography)
    @card3 = Card.new("In what year was the last NBA expansion?", 2004, :Sports)
    @card4 = Card.new("What sport did an astronaut play on the moon in 1971?", "Golf", :Sports)
    @turn1_right = Turn.new("Juneau", @card1)
    @turn2_right = Turn.new("Canada", @card2)
    @turn3_right = Turn.new(2004, @card3)
    @turn4_right = Turn.new("Golf", @card4)
    @turns = []
    @cards = [@card1, @card2, @card3, @card4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_has_a_current_card
    assert_equal @card1, @round.current_card
  end

  def test_has_a_turns_array
    assert_equal [], @round.turns
  end

  # Make sure current card advances correctly to allow for next turn
  def test_advance_turn
    turn = @turn1_right
    @round.advance_turn

    assert @round.current_card, @card2
  end

  # Make sure take_turn properly connects a guess to a card
  def test_take_turn

    assert @turn1_right, @round.take_turn("Juneau")
  end

  def test_number_correct
    # Answer question correctly, expect one total correct answer
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    # Answer question incorrectly, expect one total correct answer
    @round.take_turn("Idk")
    assert_equal 1, @round.number_correct

    # Answer question correctly, expect two total correct answers
    @round.take_turn(2004)
    assert_equal 2, @round.number_correct

    # Answer question correctly, expect three total correct answers
    @round.take_turn("Golf")
    assert_equal 3, @round.number_correct
  end

  def test_correct_by_category
    # Get 1 of 2 geography cards correct and 2 of 2 sports cards correct
    @round.take_turn("Juneau")
    @round.take_turn("Idk")
    @round.take_turn(2004)
    @round.take_turn("Golf")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 2, @round.number_correct_by_category(:Sports)
  end

  def test_percent_correct
    # Answer question correctly, expect one total correct answer
    @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct

    # Answer question incorrectly, expect one total correct answer
    @round.take_turn("Idk")
    assert_equal 50.0, @round.percent_correct

    # Answer question correctly, expect two total correct answers
    @round.take_turn(2004)
    assert_equal (2 / 3.0) * 100, @round.percent_correct

    # Answer question correctly, expect three total correct answers
    @round.take_turn("Golf")
    assert_equal 75.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    # Get 1 of 2 geography cards correct and 2 of 2 sports cards correct
    @round.take_turn("Juneau")
    @round.take_turn("Idk")
    @round.take_turn(2004)
    @round.take_turn("Golf")

    assert_equal 50.0, @round.percent_correct_by_category(:Geography)
    assert_equal 100.0, @round.percent_correct_by_category(:Sports)
  end
end

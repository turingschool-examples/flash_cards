require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  attr_reader :card1, :card2, :card3, :turn1, :turn2, :turn3

  # sets up instance variables/attributes to be called throughout code without placing
  # them in each method individually
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Who was the first woman to win a Noble Prize?", "Marie Curie", :Science)
    @card3 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)
    @turn1 = Turn.new("Juneau", @card1)
    @turn2 = Turn.new("Einstein",@card2)
    @turn3 = Turn.new("Dadaism", @card3)
  end

  # checks to see if the card exists
  def test_card_exists
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
  end

  # checks to see if the turn exists
  def test_turn_exists
    assert_instance_of Turn, @turn1, card1
    assert_instance_of Turn, @turn2, card2
    assert_instance_of Turn, @turn3, card3
  end

  #checks that a card is displayed during turn
  def test_card_display
    assert_equal "What is the capital of Alaska?", @card1.question
    assert_equal "Who was the first woman to win a Noble Prize?", @card2.question
    assert_equal "What style of art is characterized by its distinct use of dots to form images?", @card3.question
  end

  #checks that answer is submitted during turn
  def test_guess_submission
    assert_equal "Juneau", @turn1.guess
    assert_equal "Einstein", @turn2.guess
    assert_equal "Dadaism", @turn3.guess
  end

  #checks to see if guess is correct
  def test_guess_accuracy
    assert_equal true, @turn1.correct?
    assert_equal false, @turn2.correct?
    assert_equal false, @turn3.correct?
  end

  #checks to ensure feedback is displayed depending on if guess is correct or not
  def test_feedback_display
    assert_equal "Correct!", @turn1.feedback
    assert_equal "Incorrect, try again!", @turn2.feedback
    assert_equal "Incorrect, try again!", @turn3.feedback
  end
end

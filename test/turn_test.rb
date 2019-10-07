require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/turn'

class TurnTest < Minitest::Test
  attr_reader :card1,
              :card2,
              :card3,
              :turn1,
              :turn2,
              :turn3

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn1 = Turn.new("Juneau", @card1)
    @turn2 = Turn.new("Mercury",@card2)
    @turn3 = Turn.new("North north west", @card3)
  end

  # checks to see if the card exists
  def test_card_exists
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
  end

  # checks to see if the turn exists
  def test_turn_exists
    assert_instance_of Turn, @turn1
    assert_instance_of Turn, @turn2
    assert_instance_of Turn, @turn3
  end

  #checks that a card is displayed during turn
  def test_card_display
    assert_equal "What is the capital of Alaska?", @card1.question
    assert_equal "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @card2.question
    assert_equal "Describe in words the exact direction that is 697.5° clockwise from due north?", @card3.question
  end

  #checks that answer is submitted during turn
  def test_guess_submission
    assert_equal "Juneau", @turn1.guess
    assert_equal "Mercury", @turn2.guess
    assert_equal "North north west", @turn3.guess
  end

  #checks to see if guess is correct
  def test_guess_accuracy
    assert_equal true, @turn1.correct?
    assert_equal false, @turn2.correct?
    assert_equal true, @turn3.correct?
  end

  #checks to ensure feedback is displayed depending on if guess is correct or not
  def test_feedback_display
    assert_equal "Correct!", @turn1.feedback
    assert_equal "Incorrect, try again!", @turn2.feedback
    assert_equal "Correct!", @turn3.feedback
  end
end

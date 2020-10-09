require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'


class RoundTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
    @cards = [@card1,@card2,@card3]

    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @cards, @round.deck.cards
    assert_equal [], @round.turns
  end

  def test_methods_working
    assert_equal @cards[0], @round.current_card
    assert_equal Turn.new("Juneau",@cards[0]), @round.take_turn("Juneau")
  end

  def test_it_tracks_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_it_tracks_number_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_tracks_percent_correct
    @round.take_turn("Juneau")
    assert_equal 100, @round.percent_correct
  end

  def test_it_tracks_percent_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 100, @round.percent_correct_by_category(:Geography)
    assert_equal 0, @round.percent_correct_by_category(:STEM)
  end

  def test_it_can_return_categories
    require 'pry' ; binding.pry
    assert_equal [], @round.categories_in_deck
    @round.take_turn("Juneau")
    assert_equal [:Geography], @round.categories_in_deck
  end
end

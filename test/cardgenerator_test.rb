require './lib/cardgenerator'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CardgeneratorTest < Minitest::Test
  def setup
    @make_cards = Cardgenerator.new('./lib/cards.txt')
  end
  def test_it_runs
    assert_instance_of Cardgenerator, @make_cards
  end

  def test_it_makes_an_array
    assert_instance_of Array, @make_cards.data
  end



end

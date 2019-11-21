require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'

class CardGeneratorTest < Minitest::Test

  def setup
    @cardgenerator = CardGenerator.new('./data/cards.txt')
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cardgenerator
  end
end

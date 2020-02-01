require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test
  def setup

    filename = './lib/cards.txt'
    @cards = CardGenerator.new(filename)
  end

  def test_it_exists

    assert_instance_of CardGenerator, @cards
  end

  def test_it_has_cards_


    assert_equal [], @cards.cards
  end


end

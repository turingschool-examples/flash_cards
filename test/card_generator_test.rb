require_relative 'test_helper'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < MiniTest::Test

  def setup
    @filename = 'cards.txt'
    @card_stack = CardGenerator.new(@filename)
  end

  def test_card_generator_exists_with_file
    assert_instance_of CardGenerator, @card_stack
    assert_equal 'cards.txt', @card_stack.filename
  end

  def test_card_generator_returns_cards
    assert_equal 4, @card_stack.cards.length
    assert_instance_of Card, @card_stack.cards.first
    assert_instance_of Card, @card_stack.cards.last
  end
end


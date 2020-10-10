require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'


class Card_GeneratorTest < Minitest::Test

  def setup
    @filename = "cards.txt"
    @card_1 = Card.new("What is 5 + 5?", "10", "STEM")
    @card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turin Staff")
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber","PopCulture")
    @new_cards = [@card_1, @card_2, @card_3, @card_4]
  end


  def test_if_it_can_make_cards
    cards = Card_Generator.new(@filename)
    assert_equal @new_cards, Card_Generator.new(@file_name).cards
  end
end

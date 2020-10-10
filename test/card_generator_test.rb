require "Minitest/autorun"
require "Minitest/pride"
require "./lib/card_generator"
require './lib/card'

class CardGeneratorTest < Minitest::Test
  def setup
    filename = "./lib/cards.txt"
    @card_generator = CardGenerator.new(filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @card_generator
  end

  def test_it_opens_file
    assert_equal ["What is 5 + 5?,10,STEM",
      "What is Rachel's favorite animal?,red panda,Turing Staff",
      "What is Mike's middle name?,nobody knows,Turing Staff",
      "What cardboard cutout lives at Turing?,Justin Bieber,Pop Culture"],
      @card_generator.raw_data
  end

  def test_it_creates_new_cards_upon_instantiation
    assert_instance_of Card, @card_generator.cards[0]
  end
end
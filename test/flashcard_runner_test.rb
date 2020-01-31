require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "./cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_a_string_works
    value = "What is 5 + 5?,10,STEM
What is Rachel's favorite animal?,red panda,Turing Staff
What is Mike's middle name?,nobody knows,Turing Staff
What cardboard cutout lives at Turing?,Justin bieber,PopCulture"
    CardGenerator.new(value)

    # assert_instance_of CardGenerator, cards
  end
end

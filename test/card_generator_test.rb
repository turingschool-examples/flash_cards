require "Minitest/autorun"
require "Minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "./lib/cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_opens_file
    filename = "./lib/cards.txt"
    card_generator = CardGenerator.new(filename)
    card_generator.open_file

    assert_equal ["What is 5 + 5?,10,STEM",
      "What is Rachel's favorite animal?,red panda,Turing Staff",
      "What is Mike's middle name?,nobody knows,Turing Staff",
      "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"],
       card_generator.raw_data
  end
end
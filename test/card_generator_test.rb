require './lib/card_generator'
require 'minitest/autorun'
require 'minitest/pride'


class CardGeneratorTest < Minitest::Test

  def test_it_exists

    cards = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, cards
  end

  def test_it_can_load_a_file
    filename = File.read("cards.txt").split

    assert_equal filename = "cards.txt", filename
  end

  def test_it_can_parse_data

    filename = File.read("cards.txt").split("\n")
    file_data = ["What is 5 + 5?,10,STEM" ,"What is Rachel's favorite animal?,red panda,Turing Staff" ,"What is Mike's middle name?,nobody knows,Turing Staff" , "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"]
    assert_equal file_data, filename
  end

  def test_it_makes_cards



  end

end

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def setup
    @card_file = CardGenerator.new("cards.txt")
    @line_1 = "What is 5 + 5?,10,STEM"
    @line_2 = "What is Rachel's favorite animal?,red panda,Turing Staff"
    @line_3 = "What is Mike's middle name?,nobody knows,Turing Staff"
    @line_4 = "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"
  end
#test it exists
  def test_file_exists
    assert_instance_of CardGenerator, @card_file
  end
#test it initializes
  def test_starts_with_empty_cards_array
    assert_equal [], @card_file.cards
  end

#test it can read lines into an array
  def test_can_read_to_strings_from_file
    lines = @card_file.read_to_string
    assert_instance_of Array, lines
    assert_equal 4, lines.length
    assert_equal @line_1, lines.first
    assert_equal @line_4, lines.last
  end

  def test_convert_for_cards
    parts = @card_file.convert_for_cards(",")
    binding.pry 
    assert_instance_of Array, parts
    assert_equal "What is 5 + 5?", parts[0][0]
    assert_equal "nobody knows", parts[2][1]
    assert_equal "TuringStaff", parts[2][2]
  end
end

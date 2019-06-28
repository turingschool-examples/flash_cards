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
    @card_file_2 = CardGenerator.new("my_cards.txt")
  end

  def test_file_exists
    assert_instance_of CardGenerator, @card_file
  end

  def test_starts_with_empty_cards_array
    assert_equal [], @card_file.cards
  end

  def test_can_read_to_strings_from_file
    lines = @card_file.read_to_string
    assert_instance_of Array, lines
    assert_equal 4, lines.length
    assert_equal "What is 5 + 5?,10,STEM", lines.first
    assert_equal "What cardboard cutout lives at Turing?,Justin bieber,PopCulture", lines.last
  end

  def test_can_read_to_strings_from_other_file
    lines = @card_file_2.read_to_string
    assert_instance_of Array, lines
    assert_equal 8, lines.length
  end

  def test_convert_for_cards
    parts = @card_file.convert_for_cards(",")
    assert_instance_of Array, parts
    assert_equal "What is 5 + 5?", parts[0][0]
    assert_equal "nobody knows", parts[2][1]
    assert_equal "Turing Staff", parts[2][2]
  end

  def test_convert_for_cards_with_other_separator
    parts = @card_file_2.convert_for_cards(";")
    assert_instance_of Array, parts
    assert_equal "Innova", parts[0][1]
    assert_equal "Disc Golf", parts[2][2]
    assert_equal "Movie Quotes", parts.last.last
  end

  def test_make_cards
    cards = @card_file.make_cards(",")
    assert_instance_of Card, cards[1]
    cards_2 = @card_file_2.make_cards(";")
    assert_instance_of Card, cards_2.last
  end

  def test_made_cards_have_attributes
    cards = @card_file.make_cards(",")
    assert_equal "What is 5 + 5?", cards[0].question
    assert_equal "10", cards[0].answer
    assert_equal "STEM", cards[0].category
  end
end

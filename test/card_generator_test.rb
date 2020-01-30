require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test

  def test_it_exists
    cards = CardGenerator.new

    assert_instance_of CardGenerator, cards
  end

  def test_it_can_read_a_file_into_array
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of Array, cards
    cards.each do |card|
      assert_instance_of Card, card
    end
    
  end

end

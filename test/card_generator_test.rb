require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"
require "./lib/card"


class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_it_can_read_a_file
    filename = "cards.txt"
    file_contents = CardGenerator.new(filename).read_in_file

    refute_equal [] , file_contents

  end

  def test_it_can_read_file_into_array_of_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    cards.each do |card|
      assert_instance_of Card, card
    end

  end

end

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

end

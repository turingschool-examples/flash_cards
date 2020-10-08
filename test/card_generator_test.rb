require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
    @filename = '../file.txt'
    @card_generator = CardGenerator.new(@filename)
  end

  def test_it_exists_and_loads_file

    assert_instance_of CardGenerator, @card_generator
    assert_equal '../file.txt', @card_generator.filename
  end





end

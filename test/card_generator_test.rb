require './lib/card_generator'
require 'minitest/autorun'
require 'pry'
class CardGeneratorTest < Minitest::Test
    
    def test_it_exists
        cards = CardGenerator.new
        assert_instance_of CardGenerator , cards
    end

    def test_it_can_load_a_file
        filename = File.read("cards.txt").split
        assert_equal filename = "cards.txt" , filename
    end

    def test_it_can_parse_data
        filename = File.read("cards.txt").split

        assert_equal  , filename
    end

end
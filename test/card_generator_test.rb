require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_generates_cards
    filename = "cards.txt"
    
    cards = CardGenerator.new(filename)
    
    # require 'pry'; binding.pry

    cards = CardGenerator.new(filename).cards
    require 'pry'; binding.pry
  end
end
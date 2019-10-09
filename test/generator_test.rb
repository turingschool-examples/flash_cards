require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/cards'

class GeneratorTest < Minitest::Test
  def setup
    filename = 'cards.txt'
    cards = CardGenerator.new(filename.cards)
  end

end

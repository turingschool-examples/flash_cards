require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'
require 'pry'
class GeneratorTest < MiniTest::Test
  def test_it_exists
    filename = File.readlines("././cards.txt")
    cards = CardGenerator.new(filename).cards
  end
end

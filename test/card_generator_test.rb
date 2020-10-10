require "minitest/autorun"
require "minitest/pride"
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/study_session'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    filename = './data/cards.txt'
    cards = CardGenerator.new(filename).cards
  end
end

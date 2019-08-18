require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
     @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
     @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
     @card_4 = Card.new("What is the name of Han Solo's ship?", "Millennium Falcon", :StarWars)
     @card_5 = Card.new("What is the famous weapon used by Jedi Knights?", "Light Sabor", :StarWars)
     @card_6 = Card.new("How many engines are on an X-wing fighter?", "4", :StarWars)
     @card_7 = Card.new("Who is the most loyal friend and first mate of Han Solo's?", "Chewie", :StarWars)
     @card_8 = Card.new("What quality did Luke Skywalker lack as the reason Yoda said he didn't want to train Luke?", "Patience", :StarWars)
     @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8]
     @deck = Deck.new(@cards)
     @round = Round.new(@deck)
     @cardgenerator = CardGenerator.new("./lib/cards.txt")
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cardgenerator
  end

  def test_it_has_cards
    refute_empty @cards, @cardgenerator.cards
  end

  def test_method_count
    assert_equal 8, @cardgenerator.count
  end

end

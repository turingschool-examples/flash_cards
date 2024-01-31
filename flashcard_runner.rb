require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

# Documentation for class Game
class Game
  def initialize
    card1 = Card.new('What is 1 + 1?', '2', :math)
    card2 = Card.new('What is the author\'s first name?', 'Neil', :other)
    card3 = Card.new('What is the integral of (x dx) evaluated from 0 to 2?', '2', :math)
    card4 = Card.new('Who is the president of the United States as of January 2024?', 'Joe Biden', :other)
    @cards = [card1, card2, card3, card4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    puts "Welcome! You\'re playing with #{@cards.length} cards."
  end
end

Game.new.start

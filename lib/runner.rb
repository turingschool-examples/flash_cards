#Iteration 3
require_relative './card'
require_relative './turn'
require_relative './deck'
require_relative './round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
  and reports about the surface of which planet?", "Mars", :STEM)

card_3 = Card.new("Describe in words the exact direction
   that is 697.5° clockwise from due north?", "North north west", :STEM)
$cards= [card_1, card_2, card_3]

deck = Deck.new($cards)
round = Round.new($deck)

class Game
  def initialize
    @card_counter = 0
  end
  def welcome
    puts "Welcome! You're playing a game with #{$cards.length} cards \n
    ------------------------------------------- \nThis is card number 1 out of #{$cards.length}"
  end

  def start
    puts "Question: #{$cards[@card_counter].question}"
    user_answer = gets.to_s
    Turn.new(user_answer, $cards[@card_counter])

  end

end

game = Game.new
game.welcome
game.start

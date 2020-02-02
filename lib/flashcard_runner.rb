require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Game
  def initialize
    @card_number = 1

    @card1 = Card.new("What is the capitol of CO?", "Denver", :Geography)
    @card2 = Card.new("What is 2+2?", "4", :Math)
    @card3 = Card.new("What continent is CO in?", "North America", :Geography)
    @card4 = Card.new("Red or green?", "Christmas", :Culture)
    @card5 = Card.new("What is 7*5?", "35", :Math)
    @card6 = Card.new("What state is directly below CO?", "NM", :Geography)
    @card7 = Card.new("What is 10*4?", "40", :Math)
    @card8 = Card.new("What is love?", "Baby don't hurt me", :Culture)

    @cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8]
    @deck1 = Deck.new(@cards)
    @round1 = Round.new(@deck1)
    @start_key = nil

  end
  def welcome
    puts "Welcome! You're playing with #{@cards.count} cards."
    puts "--------------------------------------------------"
    puts "- - - - - - - -Hit any key to start- - - - - - - -"
    puts "--------------------------------------------------"
    puts ">"
    @start_key = $stdin.gets.chomp
  end
  def start
    @deck1.cards.each do |card|
    puts "This card number #{@card_number} out of #{@cards.count}"
    puts "Question: #{@round1.current_card.question}"
    puts ">"
    user_guess = $stdin.gets.chomp
    new_turn = Turn.new(user_guess, @round1.current_card)
    @round1.take_turn(user_guess)
    @card_number += 1
    puts new_turn.feedback
    end
  end
end

game1 = Game.new
game1.welcome
game1.start

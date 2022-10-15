require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'





class Game
  attr_reader :card_1, :card_2, :card_3, :card_4, :cards, :deck, :round

  def initialize
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @card_4 = Card.new("What is 5 + 5?", "10", :Math)
    @cards = [card_1, card_2, card_3, card_4]
    @deck = Deck.new(cards)
    @round =Round.new(deck)
  end


  def start(card)
    p "Welcome! You're playing with #{deck.count} cards."
    p "-----------------------------------------------"
    #p "This is card number #{cards.count} out of 4."
    while round.turns.length < 4
      p "Question: #{round.current_card.question}"
      guess = gets.chomp
      round.take_turn(guess)
      p round.turns.last.feedback
    end
  end
end

new_game = Game.new
new_game.start(:card_1)

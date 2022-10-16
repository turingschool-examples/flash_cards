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
    # p "This is card number #{round.turns.length + 1} out of #{deck.count}."
    while round.turns.length < 4
      p "This is card number #{round.turns.length + 1} out of #{deck.count}."
      p "Question: #{round.current_card.question}"
      guess = gets.chomp
      round.take_turn(guess)
      p round.turns.last.feedback
    end
  end

  def end_game
    p "****** Game over! ******"
    p "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%"
    p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    p "Math - #{round.percent_correct_by_category(:Math)}% correct"
    p "Geography - #{round.percent_correct_by_category(:Geography)}% correct"

  end
end

new_game = Game.new
new_game.start(:card_1)
new_game.end_game

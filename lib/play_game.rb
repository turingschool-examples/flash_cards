require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class PlayGame
  attr_writer :guess

  def initialize(guess)
    @guess = guess
  end

  def start
    p "Welcome! You're playing with 4 cards."
    p "-------------------------------------------------"

    deck_1 = Deck.new(cards)
    round = Round.new(deck_1)
    game = Turn.new(@guess, round)
    counter = 1

    until counter == 5
      p "This is card number #{counter} out of 4."
      p "Question #{counter} is: #{round.current_card.question}"
      p "> "
      @guess = gets.chomp.downcase
      answer = round.take_turn(@guess)
      p answer.feedback
      counter += 1
    end

  end
end

# round = Round.new(deck)

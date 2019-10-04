require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class Round
attr_reader :deck,
            :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
   player_turn = Turn.new(guess,current_card)
   @turns << player_turn
   player_turn
  end
  #
  # def correct?
  #   @guess == @card.answer
  # end

  def number_correct
    number_of_correct_guesses = 0
    @turns.each do |turn|
      if @correct?
        number_of_correct_guesses += 1
      end
    end
      number_of_correct_guesses
  end
end

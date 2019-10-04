require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class Round
  attr_reader :deck,
              :turns,
              :current_card_index,
              :number_of_correct_guesses

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
    @number_of_correct_guesses = 0
  end

  def current_card
    @deck.cards[@current_card_index]
  end

  def take_turn(guess)
    player_turn = Turn.new(guess,current_card)
    @turns << player_turn
    @current_card_index += 1
     if player_turn.correct?
       @number_of_correct_guesses += 1
    end
    player_turn
  end

  def number_correct
    @number_of_correct_guesses
  end


  def percent_correct
    number_correct / @turns.count * 100
  end

end

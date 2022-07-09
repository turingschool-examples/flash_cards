require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)#Create new turn object with guess and card
    @turns << new_turn #Store this new turn object in @turns
    #Change current card to next card in array - maybe push out first element?
    if new_turn.correct? == true
      @number_correct += 1
    end
    new_turn
  end

end

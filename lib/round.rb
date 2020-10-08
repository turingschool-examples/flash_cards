require './lib/turn'

class Round
attr_reader :deck, :turns, :card_tracker

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_tracker = 0
  end

  def current_card
    deck.cards[card_tracker]
  end

  def take_turn(guess)
    turn = Turn.new(guess, deck.cards[card_tracker])
   @turns << turn
   @card_tracker += 1
   
   turn
  end
end
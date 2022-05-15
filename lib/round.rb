require './lib/turn'
class Round
  attr_reader :deck, :turns, :new_turn
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    if new_turn.guess == new_turn.card.answer
    end
    turns << new_turn
    new_turn
  end
end

class Round
  attr_reader :deck, :turns, :card_number
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_number = 0
  end

  def current_card
    deck.cards[card_number]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @card_number += 1
    new_turn
  end


end

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @turn_number = 0
  end

  def current_card
    deck.cards[@turn_number]
  end

  
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turn_number += 1
    @turns << turn
    turn
  end
end
class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_number = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[@turn_number]
  end

  
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turn_number += 1
    @number_correct += 1 if turn.correct?
    @turns << turn
    turn
  end
end
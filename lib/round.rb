
class Round

  attr_reader :deck, :turns, :number_correct, :number_wrong
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0
  end

  def current_card
    return deck.cards[0]
  end

  def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      turn.correct? ? @number_correct += 1 : @number_wrong += 1
    
    return turn
  end


end


class Round

  attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
  end


  def take_turn(guess)
      turn = Turn.new(guess, current_card)
      @turns << turn
      turn.correct? ? @number_correct += 1 : @number_wrong += 1
      @current_card = deck.cards[+1]
    return turn
  end


end

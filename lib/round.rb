
class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.correct? == true
      @number_correct += 1
    end
    @deck.cards.shift
    @current_card = @deck.cards.first
    return turn
  end


end

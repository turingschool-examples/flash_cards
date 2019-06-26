
class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(string)
    turn = Turn.new(string, @deck.cards[0])
    @turns << turn
    @deck.cards.unshift
    return turn
  end

  def number_correct
    if @turns[0].guess == @turns[0].card.answer
      @number_correct += 1
    end
  end
end

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @deck.cards.shift
      add_number_correct
    else @deck.cards.rotate!
    end
    return turn
  end

  def add_number_correct
    @number_correct += 1
  end
end

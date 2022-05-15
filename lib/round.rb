class Round
attr_reader :turns, :deck, :turn,:number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
      turns << turn
      if turn.correct?
        @number_correct += 1
      end
      deck.cards.shift
    return turn
  end

end

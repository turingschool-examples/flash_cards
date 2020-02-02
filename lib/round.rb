class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @count = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.shift
      if new_turn.correct?
        @number_correct += 1
      end

      return new_turn
  end


end

class Round
  attr_reader  :deck,
                    :turns,
                    :answers_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @answers_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    if turns.last.card.answer == turns.last.guess
      @answers_correct += 1
    end
    answers_correct
  end
end

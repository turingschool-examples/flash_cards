

class Round
  attr_reader :deck,
              :turns
              :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = []
  end


  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn

    if new_turn.correct?
      @number_correct << new_turn
    new_turn
    end
  end

  def number_correct
    @number_correct.count
  end

end

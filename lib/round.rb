class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @turns_correct = [] #subset of turns array
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
      if guess == current_card.answer
        @turns_correct << turn
        # require "pry"; binding.pry
      end
    return turn

  end

  def number_correct
    @turns_correct.size
  end

end

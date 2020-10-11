class Round
  attr_reader :deck, :turns, :amount_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @amount_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    turns[-0]
  end

  def number_correct
    @turns.map do |turn|
      if turn.correct?
        @amount_correct += 1 
        # && deck.cards.shift(0)
      end
    end
  end
end

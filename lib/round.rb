class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    advance_card
    return new_turn
  end

  def advance_card
    deck.cards.rotate!(1)
    @current_card = deck.cards.first
  end

  def number_correct
    correct = turns.select do |turn|
      turn.correct?
    end
    correct.count
  end
end

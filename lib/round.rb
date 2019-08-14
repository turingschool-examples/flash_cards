class Round
  attr_accessor :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    return @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns.push(new_turn)
    return new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true }
  end
end

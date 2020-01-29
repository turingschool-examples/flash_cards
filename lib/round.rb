

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[0])
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    turns.count {|turn| turn.correct?}
  end
end

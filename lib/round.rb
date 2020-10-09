class Round

  attr_reader :deck, :turns

  def initialize (deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    turn.new(round.current_card, guess)
    round.turns << 1
  end
end

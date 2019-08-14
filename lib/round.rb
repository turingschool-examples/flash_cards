class Round
  def initialize(deck)
    @deck = deck
  end

  def deck
    @deck
  end

  def take_turns(guess)
    # It should create a new Turn object with the appropriate guess and Card.
    turn = Turn.new(guess, @deck.cards[0])

  end

end

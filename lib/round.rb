class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card #refactor me into cards!!
    deck.cards.first
  end

  def take_turn(guess)

  end

end

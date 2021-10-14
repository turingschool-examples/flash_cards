class Round
  attr_accessor :deck, :turns, :cards
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end

end

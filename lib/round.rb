class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end
# assign method value to instance array so I can change it later
  def turns
    turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end

end

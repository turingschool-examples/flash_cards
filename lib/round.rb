class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    # a turn is initialized with a guess and a card
    Turn.new(guess, current_card)
  end
end

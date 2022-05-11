class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    current_card = []
    current_card << @deck.cards[0]
    current_card
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end

end

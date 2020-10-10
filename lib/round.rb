class Round

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    rotate_to_next_turn
    Turn.new(guess, current_card)
  end

  def rotate_to_next_turn
    @deck.cards.rotate
  end
end

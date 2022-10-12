class Round
  attr_reader :deck
  attr_accessor :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn_2 = Turn.new(guess, card)
    return turn_2
    # might need @deck.shift to remove the current card (first element) from the deck array
  end

  # def class
  #   @turns
  # end
end

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
    card = current_card
    turn = Turn.new(guess, card)
      turns << turn
    return turn

  end

end

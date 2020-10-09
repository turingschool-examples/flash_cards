class Round
attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn
    deck.cards.rotate!(1)
    @current_card = deck.cards.first
    return new_turn
  end

end

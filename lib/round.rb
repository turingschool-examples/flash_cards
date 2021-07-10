class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = current_card
end

  def current_card
    current_card = Deck.shift
  end
end

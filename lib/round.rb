class Round
attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def turns
    @turns = []
  end

  def current_card
  #  @current_card = current_card
    deck.cards.first
  end
end

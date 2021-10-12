class Round
  attr_reader :deck

  def initilize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
end

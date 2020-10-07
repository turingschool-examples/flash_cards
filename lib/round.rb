class Round
attr_reader :deck, :turns, :card_tracker

  def initialize(deck)
    @deck = deck
    @turns = []
    @card_tracker = 0
  end

  def current_card
    deck.cards[card_tracker]
  end
end
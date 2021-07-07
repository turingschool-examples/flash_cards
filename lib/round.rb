class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    #need to figure out how to show the card
    @deck.cards[0]
  end
end

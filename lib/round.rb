class Round
attr_reader :deck, :turns
def initialize(deck)
  @deck = deck
  @turns = []
  @guess = 0
end
def current_card
  return deck.cards[@guess]
end
end

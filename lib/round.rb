class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count = 0
  end

  def current_card
    @deck.cards[@turn_count]
  end
end

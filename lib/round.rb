class Round
  attr_reader :deck, :turns, :turn_counter, :correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
  end


  def current_card #method current_card
    @deck.cards[@turn_counter]
  end
end

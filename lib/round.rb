class Round
  attr_reader :deck, :turns, :current_turn

  def initialize(deck)
    @deck = deck
    @turns = []
  end
end

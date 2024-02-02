class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end
end
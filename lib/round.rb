class Round
  attr_reader :deck, :turns

  def initialize(deck, turns)
    @deck = deck
    @turns = turns
  end

  def deck
    @deck
  end

  def turns
    @turns
  end

end

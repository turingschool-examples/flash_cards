class Round
  attr_reader :deck, :turns

  @@rounds = Set.new

  def initialize(deck)
    @deck = deck
    @turns = turns
    @@rounds << self
  end
end

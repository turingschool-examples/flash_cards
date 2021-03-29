class Round
  attr_reader :turns
  
  def initialize(deck)
    @deck = deck
    @turns = []
  end
end
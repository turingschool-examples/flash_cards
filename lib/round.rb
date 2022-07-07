class Round

  attr_reader :turns,
              :deck 

  def initialize(deck)
    @deck = deck
    @turns = []
  end
end

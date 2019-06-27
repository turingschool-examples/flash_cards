class Round
  attr_reader :deck, :turns
  def initialize(deck,turns)
    @deck = deck
    @turns = []
  end


def deck
  @deck
end

def current_card
  @deck[0]
end

end #class

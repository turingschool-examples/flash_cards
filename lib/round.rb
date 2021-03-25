class Round
  attr_reader :turns,
              :deck
  
  def initialize(deck) 
    @deck   = deck
    @turns  = []
  end
  
  def current_card
    deck.cards.first
  end
end
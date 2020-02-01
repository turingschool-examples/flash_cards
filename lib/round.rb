class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end
  def current_card
    @deck.cards[@current_card]
  end
  def deck
    @deck
  end 


end

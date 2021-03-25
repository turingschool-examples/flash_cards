class Round
  attr_accessor :turns, :deck, :cards

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    deck.cards[0]
  end

  def new_turn
    turns.push(1)
  end

  def take_turn

  end

end



#

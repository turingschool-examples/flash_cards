class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def take_turn(guess)
    # this method needs to create a turn, removes the card from the deck, and moves on through
    # deck.cards is an array BUT deck is NOT 
    deck[0]
  end


end

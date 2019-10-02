class Round
attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def deck
    @card.count
  end

def take_turn(guess)
  #initialize turn object with the appropriate guess and Card.
  #The idea is that when we start a Round,
  # the current card is the first in the deck (the first in the Deck’s array of Cards)
  #When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.
end
end

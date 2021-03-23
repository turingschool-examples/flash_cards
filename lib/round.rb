class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    # @current_card = @deck.cards[0]
  end

  # TODO:
  # Current card as first in deck
  # Make a guess: guess is recorded and the next card becomes current card

  def take_turn
    #takes a string representing the guess, creates a new Turn object with this
    #guess and card. Store this turn and return from the method.
    #should also trigger a move to the next card in the deck.
  end

end

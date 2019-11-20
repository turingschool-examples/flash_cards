class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck
    # require "pry"; binding.pry
    # I need the first card in the array of cards that a deck holds
    # @deck is calling on the instance of my Deck class, however,
    # the cards are not accessible in the current state
    # considering that deck is an instance of Deck, I have access to
    # its methods, one of which is cards, which holds the array
    # of cards in a deck
    # will figure out what the next steps are later
  end

end

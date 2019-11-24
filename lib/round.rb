# NOTE: plug in actual values instead of variables to get to run, then go find that exact variable

class Round
  attr_reader :deck, :turns, :cards

  def initialize(deck)
    @deck = deck
    @turns = []
    # @cards = cards
  end

  def current_card
    # require "pry"; binding.pry
    deck.cards.first
  end
end

# frozen_string_literal: true

# Where the main game is played. Starts with a deck, tracks statistics.
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @deck_index = 0
  end

  def current_card
    @deck.cards[@deck_index]
  end
end

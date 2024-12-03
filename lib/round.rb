# frozen_string_literal: true

# Where the main game is played. Starts with a deck, tracks statistics.
class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end
end

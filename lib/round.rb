# NOTE: plug in actual values instead of variables to get to run, then go find that exact variable

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    # require "pry"; binding.pry
  end
end

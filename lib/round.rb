# NOTE: plug in actual values instead of variables to get to run, then go find that exact variable

class Round
  attr_reader :deck, :turns, :cards, :category, :guess, :card#, :new_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    # @cards = cards
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    # require "pry"; binding.pry
  end
end

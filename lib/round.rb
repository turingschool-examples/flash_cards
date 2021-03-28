

class Round
  attr_accessor :deck,
                :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
    # require "pry"; binding.pry
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turn
    require "pry"; binding.pry
  end

  # def turns
  #
  #
  #   # require "pry"; binding.pry
  # end


end

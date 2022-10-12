class Round
  attr_reader :deck, :turns
  # , :current_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    # @current_turn = nil
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @deck.cards[0])
    @deck.cards.shift
    return current_turn
  end
end

# require "pry"; binding.pry

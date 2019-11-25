require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = []
    @guesses = []
  end

  def guess
    @guess = Turn.guess
  end

  def current_card
    @deck.count
  end

  def current_card
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    guess = Turn.new
  end

end

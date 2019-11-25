require './lib/turn'
require './lib/runner'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = []
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
    Turn.new.guess(@guess, @current_card)
  end

  def new_turn
    new_turn = Round.take_turn(guess)
  end

end

require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = []
    @new_turn = []
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
    Turn.new.guess(current_card, guess)
  end

  def new_turn
    @new_turn = Turn.new.guess(current_card, guess)
  end

end

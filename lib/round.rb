require 'pry'
class Round
  attr_reader :deck
  # need a turns array attr to dump my used cards into

  def initialize(deck_parameter)
    @deck = deck_parameter
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
  end

end

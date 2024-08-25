require './lib/turn'
require './lib/card'

class Round
  attr_reader :turns, :current_card, :deck

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    turns << current_turn
    current_turn
  end

  def number_correct_by_category(category)
    turns.count { |turn| turn.card.category == category }
  end
end

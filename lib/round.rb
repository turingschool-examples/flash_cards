require './lib/card'
require './lib/deck'
require './lib/turn'

class Round
  attr_accessor :deck, :turns, :correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = {"total_correct" => 0}
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!
    @turns.last
  end

  def number_correct
    @turns.select.count { |turn| turn.correct? == true}
  end

  def number_correct_by_category(category)
    @turns.select.count { |turn| turn.correct? == true && turn.category == category}
  end

  def percent_correct
    (number_correct.to_f / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / @deck.cards_in_category(category).size) * 100
  end

end

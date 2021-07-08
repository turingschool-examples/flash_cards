require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def count
    @turns.count
  end

  def number_correct
    @turns.each do |turn|
      turn.correct? == true
      @correct << turn
    end
    @correct.count
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.correct? == true && turn.card.category == category
    end.count
  end

  def percent_correct_by_category
    
  end

end

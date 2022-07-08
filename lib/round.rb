require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []

  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn

    if turn.correct? == true
      @correct_turns << turn
    end
    turn
  end

  def number_correct
    @correct_turns.count
  end

  def number_correct_by_category(category)
    @correct_turns.count do |turn|
      turn.card.category == category
    end
  end


  def percent_correct
    (@correct_turns.count.to_f/@turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    correct = @correct_turns.count do |turn|
                turn.card.category == category
              end
    total = @turns.count do |turn|
                turn.card.category == category
              end
    (correct/total) * 100
  end



end

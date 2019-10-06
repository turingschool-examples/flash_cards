require './lib/card'
require './lib/turn'
require './lib/round'

class Round
  attr_reader :deck
  attr_accessor :turns, :turn, :correct_guess_counter, :turn_number
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end


  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    puts turn.feedback
  end

  def number_correct
    count = 0
    @turns.each do |turn|
      if turn.correct?
        count += 1
      end
    end
    count
  end

  def number_correct_by_category(category)
    correct_count = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct_count += 1
      end
    end
    correct_count
  end

  def percent_correct
    (number_correct / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    category_total = 0
    @turns.each do |turn|
      if turn.card.category == category
        category_total += 1
      end
    end
    (number_correct_by_category(category) / category_total.to_f) * 100
  end
end

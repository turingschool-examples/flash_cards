require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @number_correct += 1 if @new_turn.correct?
    @deck.cards.shift
    @new_turn
  end

  def number_correct_by_category(category)
    @num_by_category = @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (@number_correct.to_f / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    @category_count = @turns.count do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).to_f / @category_count) * 100
  end
end

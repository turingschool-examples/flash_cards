
require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct, :correct_in_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_in_category = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
      if turn.correct? == true
        @number_correct += 1
        correct_in_category << turn
      end
    return turn
  end

  def number_correct_by_category(category)
      collector = []
      correct_in_category.each do |turn|
        if turn.card.category == category
          collector << turn
       end
    end
    collector.count

  end

  def percent_correct
    percent_correct = ((@number_correct.to_f / turns.count)) * 100.00
  end

  def percent_correct_by_category(category)
    correct_in_category.each do |turn|
      if turn.card.category == category
       percent_correct = (@correct_in_category.count / @turns.count) * 100.00
      end
    end
    return percent_correct
  end

end

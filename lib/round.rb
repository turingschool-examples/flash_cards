require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
      if turn.correct? == true
        @number_correct += 1
      end
    turn
  end

  def number_correct_by_category(turn_category)
    turns_category = []
    @turns.each do |turn|
      if turn.card.category == turn_category
        turns_category << turn
      end
    end
    correct_by_category = 0
    turns_category.each do |turn|
      if turn.feedback == "Correct!"
        correct_by_category += 1
      end
    end
    correct_by_category
  end

  def percent_correct
    correct_answer = (@number_correct.to_f / @turns.count * 100)
  end

  def percent_correct_by_category(current_category)
    turns_category = []
    @turns.each do |turn|
      if turn.card.category == current_category
        turns_category << turn
      end
    end
    (number_correct_by_category(current_category).to_f / (turns_category.count) * 100)
  end

end

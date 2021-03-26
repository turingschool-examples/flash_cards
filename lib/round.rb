require './lib/game'
require 'pry'

class Round
  attr_reader :deck,
              :turns,
              :current_card_num,
              :current_card,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_num = 0
    @current_card = deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    @current_card = deck.cards[current_card_num]
    new_turn = Turn.new(guess, @current_card)
    evaluate_correctness(new_turn)
    @turns << new_turn
    @current_card_num += 1
  end

      def evaluate_correctness(new_turn)
        if new_turn.correct? == true
          @number_correct += 1
        end
      end

  def number_correct_by_category(category)
    num_correct_in_category = turns.find_all do |turn|
      if turn.card.category == category
        turn.correct? == true
      end
    end
    num_correct_in_category.count
  end

  def percent_correct
    (@number_correct.to_f / turns.count) * 100
  end

  def percent_correct_by_category(category)
    num_in_category = turns.find_all do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).to_f / num_in_category.count) * 100
  end
end

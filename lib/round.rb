require './lib/card'
require './lib/turn'
require './lib/deck'
# require "pry"; binding.pry
class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
     new_turn = Turn.new(guess, current_card)
      @turns << new_turn
      rotate_card
      return new_turn
  end

  def rotate_card
    deck.cards.shift
  end

  def number_correct
    correct_answers = @turns.find_all do |turn|
      turn.correct? == true
    end
    return correct_answers.length
  end

  def number_by_category(category)
    turns_in_category = @turns.select do |turn|
      turn.card.category == category
    end
    return turns_in_category.length
  end

   def number_correct_by_category(category)
     turns_in_category = @turns.select do |turn|
       turn.card.category == category
     end
     correct_in_category = turns_in_category.find_all do |turn|
       turn.correct? == true
    end
    return correct_in_category.length
   end

   def percent_correct
     correct_answers = @turns.find_all do |turn|
       turn.correct? == true
     end

     total_correct = correct_answers.length.to_f / @turns.count
    return total_correct.to_f * 100
   end


  def percent_correct_by_category(category)
      turns_in_category = @turns.select do |turn|
        turn.card.category == category
      end
      correct_in_category = turns_in_category.find_all do |turn|
        turn.correct? == true
     end
     total_correct = correct_in_category.length.to_f / turns_in_category.count
    return total_correct.to_f * 100
  end
end

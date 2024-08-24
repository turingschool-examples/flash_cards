require 'pry'

class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @index = 0
    #binding.pry
  end

  def take_turn(guess, card = @current_card)
    turn = Turn.new(guess, card)
    @turns << turn
    @index += 1
    @current_card = deck.cards[@index]
    turn
  end
  
  def number_correct
    correct_answers = @turns.find_all do |turn|
    turn.correct? == true
    end
    correct_answers.length
  end

  def number_correct_by_category(category)
    correct_answers = @turns.find_all do |turn|
    turn.correct? == true
    end
    correct_answers_by_cat = correct_answers.find_all do |correct_answer|
      correct_answer.card.category == category
    end
    correct_answers_by_cat.length
  end

  def percent_correct
    if @turns.length != 0
      correct_answers = @turns.find_all do |turn|
        turn.correct? == true
        end
#binding.pry
      return ((correct_answers.length.to_f / @turns.length.to_f) * 100).round(2)
    end
  end
end
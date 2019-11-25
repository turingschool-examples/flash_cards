require './lib/deck'
require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(user_guess)
    new_turn = Turn.new(user_guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn

  end

  def number_correct
    turn_correct = 0
     @turns.each do |turn|
       if turn.correct?
         turn_correct += 1
       end
     end
    cards_correct = 0 + turn_correct
  end

  def number_correct_by_category(category)
    correct_category = []
    correct_category = @turns.find_all do |turn|
      category == turn.card.category
    end
    turn_correct_by_category = []
    turn_correct_by_category = correct_category.find_all do |turn|
      turn.correct?
    end
    turn_correct_by_category.length
  end

  def percent_correct
    ((number_correct.to_f / (@turns.length).to_f) * 100)
  end

  def percent_correct_by_category(category)
    x = number_correct_by_category(category)
    category_count = 0
    @turns.each do |turn|
      if category = turn.card.category
        category_count += 1
      end
    end
    y = [category_count].length
    ((x.to_f) / (y.to_f) * 100)
  end

end

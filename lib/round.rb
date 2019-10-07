require 'pry'

class Round
  number_correct = 0

  attr_accessor :deck, :turns

  def initialize (deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.shift
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    correct = 0
    @turns.each do |turn|

      if turn.guess == turn.card.answer
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    correct = 0
    category_selected = @turns.find_all do |turn|
    turn.card.category == category
  end
    if category_selected.last.guess == turns.last.card.answer
    correct += 1
    end
    correct
  end

  def percentage_correct
  number_correct / 3
  end

  def percentage_correct_by_category(category)
    correct = 0
    category_selected = @turns.find_all do |turn|
    turn.card.category == category
  end
  if category_selected.last.guess == turns.last.card.answer
  correct += 1
  end
  correct / 3
end
end

#use find to get all the correct? is true to see percentage true

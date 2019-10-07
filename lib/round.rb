require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round

  attr_accessor :deck,
                :guess,
                :turns

  def initialize(deck)
    @deck = deck
    @guess = guess
    @turns = []
  end

  def take_turn(guess)
    next_turn = Turn.new(guess, current_card)
    @turns << next_turn
    @deck.cards.shift
    next_turn
  end

  def current_card
    @deck.cards.first
  end


  def number_correct
    correct_number_of_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_number_of_guesses += 1
    end
  end
    correct_number_of_guesses
  end

  def percent_correct
    ((number_correct.to_f / @turns.count)*100).round
  end


  def number_correct_by_category(category)
    number_correct_in_category = 0
    @turns.each do |turn|
       if turn.card.category == category && turn.correct?
        number_correct_in_category += 1
       end
    end
    number_correct_in_category
  end

  def percent_correct_by_category(category)
    category_of_cards_in_turn = @turns.find_all do |turn|
      turn.card.category == category
    end
    ((number_correct_by_category(category).to_f/category_of_cards_in_turn.count)*100).round
  end
end

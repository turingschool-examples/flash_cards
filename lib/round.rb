require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @current_card = @deck.cards[@turns.count]
    turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? } 
    #will iterate through the turns array and return the number of correct turns
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category && turn.correct? }
    #will iterate through the turns array and return the number of correct turns for a given category
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
    #will return the percentage of correct turns
  end

  def percent_correct_by_category(category)
    total_in_category = @turns.count { |turn| turn.card.category == category }
    return 0 if total_in_category == 0
    (number_correct_by_category(category).to_f / total_in_category) * 100
    #will return the percentage of correct turns for a given category
  end
end 
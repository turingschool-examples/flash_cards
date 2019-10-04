require './lib/turn'

class Round
  attr_accessor :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    test_array = []
    @deck.cards.each { |card| test_array << card }
    test_array[@turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    outcome = []
    @turns.each { |turn| outcome << turn.correct? }
    outcome.count(true)
  end

  def number_correct_by_category(flashcard_category)
    outcome_cat = []
    x = 0
    @turns.each do |turn|
      if turn.card.category == flashcard_category && turn.correct?
        outcome_cat << turn.card.category
      end
    end
    outcome_cat.count
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(flashcard_category)
    (number_correct_by_category(flashcard_category).to_f / @deck.cards_in_category(flashcard_category)) * 100
  end

end

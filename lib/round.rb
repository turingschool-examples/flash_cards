require './lib/deck'

class Round
  attr_reader :deck, :turns, :correct_counter, :current_card, :num_turns

  def initialize (deck)
    @deck = deck
    @turns = []
    @correct_counter = 0
    @current_card = 0
    @correct_for_category = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    next_card
    new_turn
  end

  def next_card
    @current_card += 1
  end

  def number_correct
    @turns.each do |turn|
      @correct_counter += 1 if turn.correct?
    end
    @correct_counter
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
     turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    num_in_category = 0

      @turns.each do |turn|
        num_in_category += 1 if turn.card.category == category
      end

    (number_correct_by_category(category) / num_in_category.to_f) * 100
  end
end

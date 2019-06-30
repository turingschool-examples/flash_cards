require './lib/card'
require './lib/deck'
require './lib/turn'
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @turns = []
  end

  def current_card
    @deck.cards[@current_card_index]
  end

  def current_card_index
    @current_card_index
  end

  def next_card
    unless @current_card_index == (@deck.count - 1)
      @current_card_index += 1
    end
  end

  def take_turn(guess)
    this_turn = Turn.new(guess, current_card)
    turns << this_turn
    next_card
    this_turn
  end

  def number_correct
    @turns.select {|turn| turn.correct?}.length
  end

  def number_correct_by_category(category)
    @turns.select {|turn| turn.card.category == category && turn.correct?}.length
  end

  def percent_correct
    num_correct = number_correct
    total_questions = @turns.length

    if total_questions == 0
      0.0
    else
      (100 * (num_correct.to_f / total_questions)).round(1)
    end
  end

  def percent_correct_by_category(category)
    num_correct = number_correct_by_category(category)
    num_in_category = @turns.select {|turn| turn.card.category == category}.length
    if num_in_category == 0
      0.0
    else
      (100 * (num_correct.to_f / num_in_category)).round(1)
    end
  end
end

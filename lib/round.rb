# frozen_string_literal: true

# a round of multiple turns, one for each card in deck
class Round
  attr_reader :turns, :deck, :turn_count

  def initialize(deck)
    @deck = deck 
    @turns = [] 
    @turn_count = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turn_count += 1 
    @deck.cards.rotate!
    new_turn
  end 

  # number_correct helper method
  def correct_answers 
    @turns.select { |turn| turn.card.answer == turn.guess }
  end

  def number_correct
    correct_answers.count
  end

  # percent_correct helper method
  def cards_in_category(target, category)
    target.select { |turn| turn.card.category == category }
  end
  
  def number_correct_by_category(category)
    cards_in_category(correct_answers, category).count
  end

  def percent_correct
    return 0 if number_correct == 0
    number_correct / @turns.count.to_f * 100 
  end

  def percent_correct_by_category(category)
    return 0 if number_correct_by_category(category) == 0
    number_correct_by_category(category) / cards_in_category(@turns, category).count.to_f * 100
  end

  def finished?
    deck.cards.count == turn_count
  end
end

require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns.push(new_turn)
    deck.cards.shift
    new_turn
  end

  def number_correct
    turns.count do |turn|
      turn.correct? == true
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
  end

  def percent_correct
    ((number_correct.to_f / @turns.length) * 100).round(1)
  end

  def number_of_turns_by_category(category)
    turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) / number_of_turns_by_category(category)) * 100).round(1)
  end

  def categories_present
    cats_present = []
    turns.each do |turn|
      cats_present.push(turn.card.category)
    end
    cats_present.uniq
  end
end

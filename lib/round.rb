require 'pry'
require './lib/card'
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    number = 0
    @turns.each do |turn|
      if turn.correct?
        number += 1
      end
    end
    number
  end

  def number_correct_by_category(category)
    number = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
      number += 1
      end
    end
    number
  end

end

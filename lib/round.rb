require 'pry'

class Round
  attr_accessor :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.rotate!(1)
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
      number_correct / @turns.length.to_f * 100
  end

  def by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)

    number_correct_by_category(category) / by_category(category).to_f * 100

  end
end

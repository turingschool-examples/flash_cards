require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_accessor :deck
  attr_reader :turns

  def initialize(input_deck)
    @deck = input_deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end


  def number_correct
    counter = 0
    @turns.each do |turn|
      if turn.correct?
        counter += 1
      end
    end
    counter
  end

  def number_correct_by_category(category)
    counter = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        counter += 1
      end
    end
    counter
  end

  def percent_correct
    (Float(self.number_correct) / @turns.count).round(2) * 100
  end

  def percent_correct_by_category(category)
    count = 0
    correct = number_correct_by_category(category)
    @turns.each do |turn|
      if turn.card.category == category
        count += 1
      end
    end
    (Float(correct) / count).round(2) * 100
  end

end

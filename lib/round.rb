require 'pry'
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
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card) #create a turn
    @turns << turn                       # put turn into turns array
    @deck.cards.shift                    # discard "current card"
    turn                                 # return new turn
  end

  def number_correct
    correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        correct += 1.0
      end
    end
    correct
  end

  def number_correct_by_category(cat)
    correct = 0.0
    @turns.each do |turn|
      if turn.card.category == cat
        if turn.correct?
          correct += 1.0
        end
      end
    end
    correct
  end

  def percent_correct
    number_correct / @turns.count * 100
  end

  def percent_correct_by_category(cat)
    total = 0.0
    @turns.each do |turn|
      if turn.card.category == cat
        total += 1.0
      end
    end
    total
    number_correct_by_category(cat) / total * 100
  end
end

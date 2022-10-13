require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
  attr_reader :deck, :turns, :correct, :incorrect
  def initialize(deck)
    @deck = deck
    @turns = []
    @correct= []
    @incorrect = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @correct << turn
    else
      @incorrect << turn
    end
    deck.cards.rotate!
    turn
  end

  def number_correct
    correct.length
  end

  def percent_correct
    number_correct / turns.length.to_f * 100
  end

  def number_correct_by_category(category)
    correct_by_category = deck.cards_in_category(category).select do |card|
      correct.each do |turn|
        turn.card == card
      end
    end
    correct_by_category.length
  end
end

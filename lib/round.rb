require './lib/turn'

class Round
  attr_reader :deck
  attr_accessor :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    turns_by_cat = @turns.select do |turn|
      turn.card.category == category && turn.correct?
    end
    turns_by_cat.length
  end

end

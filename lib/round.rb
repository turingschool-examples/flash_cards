require './lib/turn'

class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def count
    @turns.count + 1
  end

  def question
    current_card.question
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, deck.cards.shift)
    @turns.last
  end

  def number_correct
    @turns.count { |turn|  turn.guess == turn.card.answer }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn if turn.card.category == category && turn.correct? }
  end

  def percent_correct
    ((number_correct.to_f / @turns.count) * 100).truncate(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).to_f / @turns.count { |turn| turn.card.category == category }) * 100).truncate(1)
  end
end

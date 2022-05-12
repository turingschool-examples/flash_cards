class Round
require 'turn'
attr_reader :deck, :turns
def initialize(deck)
  @deck = deck
  @turns = []
  @guess = 0
end
def current_card
  return deck.cards[@guess]
end

def take_turn(guess)
    turn = Turn.new(guess, deck.cards[@guess])
    @turns << turn
    @guess += 1
    return turn
end
def number_correct
  correct = 0
  @turns.each do |turn|
    if turn.correct?
      correct += 1
    end
  end
  return correct
end
def number_correct_by_category(category)
  correct = 0
  @turns.each do |turn|
    if turn.correct? && turn.card.category == category
      correct += 1
    end
  end
  return correct
end
end

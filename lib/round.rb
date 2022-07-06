require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns

  def initialize(deck, turns = [])
    @deck = deck
    @turns = turns
  end

  def current_card
    self.deck.cards.first
  end

  # # take_turn method
  # Pass an answer to the round.take_turn method.
  # This answer is fed into a new instance of Turn, along with the corresponding (first) card.

  def take_turn(answer, card = self.current_card)
    new_turn = Turn.new(answer, card)
    self.turns << new_turn
    new_turn
  end

  def number_correct
    correct_answers = 0
    if self.turns.last.guess == self.turns.last.card.answer
      correct_answers += 1
    end
  end
end

require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns
  attr_accessor :correct_answers

  def initialize(deck, turns = [], correct_answers = 0)
    @deck = deck
    @turns = turns
    @correct_answers = correct_answers
  end

  def current_card
    self.deck.cards.first
  end

  def take_turn(answer, card = self.current_card)
    self.deck.cards.shift
    new_turn = Turn.new(answer, card)
    self.turns << new_turn
    if self.turns.last.guess == self.turns.last.card.answer
      @correct_answers += 1
    end
    new_turn
  end

  def number_correct
    @correct_answers
  end
end

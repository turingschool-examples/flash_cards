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
    # refactor this using the .correct? method from Turn class
    if self.turns.last.guess == self.turns.last.card.answer
      @correct_answers += 1
    end
    new_turn
  end

  def number_correct
    @correct_answers
  end

# The percent correct method will take in correct_answers, convert it to a float, and divide it by the number of turns taken so far
  def percent_correct
    (@correct_answers.to_f / self.turns.count) * 100
  end

# the number correct by category method needs to take a category as an argument. it should make an array of cards that include that category. it should then test that array for correct answers (answer == guess) and return the total number of correct answers.
  def number_correct_by_category(cat)
    num_by_cat = 0
    self.turns.each do |turn|
      if turn.correct? && turn.card.category == cat
        num_by_cat =+ 1
      end
    end
    num_by_cat
  end

end

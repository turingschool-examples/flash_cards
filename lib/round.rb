require './lib/turn'

class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @new_turn = Turn.new(guess, current_card)
    @turns << @new_turn
    @number_correct += 1 if @new_turn.correct?
    @deck.cards.shift
    @new_turn
  end

  def number_correct_by_category(category)
    @num_by_category = @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end
end

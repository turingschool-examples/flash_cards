class Round
  attr_accessor :deck, :turns, :correct_answer
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    index = @turns.count
    @deck.cards[index]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    # require "pry"; binding.pry
    # find percent of correct answers
    # can use number coorect method
    number_correct.to_f / @turns.count.to_f * 100.0
  end
end


class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.count]
  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
   end
  end

  def number_correct_by_category(in_category)
    @turns.count do |turn|
    turn.correct? and (turn.card.category == in_category)

    end
    # require "pry"; binding.pry
  end
end

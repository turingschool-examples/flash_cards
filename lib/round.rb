require "pry"
class Round

  attr_reader :deck, :turns

  def initialize (deck, turns = [])
    @deck = deck
    @turns = turns
  end

  def current_card
    deck.cards[@turns.length]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    new_turn
  end

  def number_correct
    # is there a simpler way to do this without each? figure it out!
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(cat)
    @turns.count do |turn|
      turn.correct? and (turn.card.category == cat)
      end
  end

  def percent_correct
    # binding.pry
    100 * (number_correct.to_f / turns.count)
  end

  def percent_correct_by_category(cat)
#number_correct_by_category(cat) / @turns.map.count do |turn|
#(turn.card.category == cat) * 100.0
    x = @turns.count do |turn|
      (turn.card.category == cat)
    end
    y = @turns.count do |turn|
      turn.correct? and (turn.card.category == cat)
    end
    100.0 * (y.to_f / x.to_f)
  end
  # binding.pry
end

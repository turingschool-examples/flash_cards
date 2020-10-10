
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, @deck.cards.shift)
    @turns << new_turn
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(input_category)
    @turns.count do |turn|
      turn.correct? and (turn.card.category == input_category)
    end
  end

  def percent_correct
    (number_correct.to_f/ @turns.count.to_f)*100
  end

  def percent_correct_by_category(input_category)
    (number_correct_by_category(input_category).to_f/
     @turns.map.count do |turn|
      turn.card.category == input_category
      end
        )*100
  end

end

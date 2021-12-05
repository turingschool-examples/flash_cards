class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @deck.cards[@turns.size]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && category == turn.card.category
    end
  end

  def percent_correct
    ((number_correct * 100) / @turns.size).to_f
  end

  def percent_correct_by_category(category)
      (number_correct_by_category(category) * 100 / turns_by_category(category)).to_f
  end

  def turns_by_category(category)
   @turns.count do |turn|
     turn.card.category == category
  end
end


end

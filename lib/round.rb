class Round
  attr_reader :deck, :curr_card, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @curr_card = 0
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@curr_card]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    if turn.correct?
      @number_correct += 1
    end
    @turns << turn
    @curr_card += 1 unless current_card == @deck.cards[-1]
    return turn
  end

  def number_correct_by_category(cat)
    cat_correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == cat
        cat_correct += 1
      else
      end
    end
    return cat_correct
  end

def percent_correct
  (@number_correct.to_f  / @turns.count * 100).round(1)
end

  def percent_correct_by_category(cat)
    total = 0
    @turns.each do |turn|
      if turn.card.category == cat
        total += 1
      else
      end
    end
    (number_correct_by_category(cat).to_f / total * 100).round(1)
  end

end

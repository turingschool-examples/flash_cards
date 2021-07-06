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
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    return turn
  end

  def number_correct
    total_correct = 0.0
    @turns.each do |turn|
      if turn.correct?
        total_correct += 1
      end
    end
    return total_correct
  end

  def number_correct_by_category(category)
    total_correct = 0.0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        total_correct += 1
      end
    end
    return total_correct
  end

  def percent_correct
    (number_correct / @turns.size) * 100
  end

  def percent_correct_by_category(category)
    category_total = 0
    @turns.each do |turn|
      if turn.card.category == category
        category_total += 1
      end
    end
    return (number_correct_by_category(category) / category_total) * 100
  end

end

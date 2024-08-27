class Round
  attr_reader :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[@turns.length])
    @turns.last
  end

  def number_correct_by_category(category)
    total = @turns.select { |turn| turn.card.category == category }
    total.count { |turn| turn.correct? }
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true }
  end

  def get_ratio(correct, total)
    correct / total.to_f * 100
  end

  def percent_correct
    get_ratio(number_correct, @turns.count)
  end

  def percent_correct_by_category(category)
    total = @turns.count { |turn| turn.card.category == category }
    correct = number_correct_by_category(category)

    get_ratio(correct, total)
  end

  def current_card
    turns.last.card
  end
end

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
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

# use group by
  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.card.category == category
      turn.correct?
      end
    end
  end

  def percent_correct
    (number_correct.to_f / turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    num_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end
    (number_correct_by_category(category).to_f / num_in_category.length) * 100
  end

end

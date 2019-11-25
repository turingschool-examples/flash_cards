class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    # trimmed out the instance variables
    # @number_of_cards_correct = 0
    # @number_of_category_correct = 0

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    correct_count = @turns.find_all do |turn|
      # ? means it will return a boolean
      turn.correct?
    end
    # correct_count is an array
    correct_count.count
  end

  def number_correct_by_category(category)
    category_correct = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    #category_correct is an array with this method
    category_correct.count
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    cat_percent_correct = @turns.find_all do |turn|
      turn.card.category == category
    end
    # mislabeled the math formula below using the wrong variable
    return (number_correct_by_category(category) / cat_percent_correct.count.to_f) * 100
  end
end

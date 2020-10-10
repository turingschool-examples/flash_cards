class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    turn = Turn.new(guess, @deck.cards.shift)
    @turns << turn
    turn
  end

  def current_card
    @deck.current_card
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && turn.card.category == category
    end
    # @deck.cards_in_category.count do
    # turns in category
  end

  def percent_correct
    number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    num_of_questions_category = @turns.count do |turn|
      turn.card.category == category
    end
    number_correct_by_category(category).to_f / num_of_questions_category * 100
  end

end

class Round
  attr_accessor   :deck,
                  :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    # @deck.cards[@turns.length] <-- another way to write
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    correct_turns = @turns.find_all do |turn|
      if turn.correct?
        turn
      end
    end
    correct_turns.count
  end

  def correct_answers_set
    correct_answers = []
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct_answers << turn
      end
    end
    correct_answers
  end

  def category_guessed(category)
    set = @turns.find_all do |turn|
      turn.card.category == category
    end
    set
  end

  def correct_category_set(category)
    set = correct_answers_set.find_all do |turn|
      turn.card.category == category
    end
    set
  end

  def number_correct_by_category(category)
    correct_category_set(category).count
  end

  def percent_correct
    (number_correct.to_f / @turns.count) * 100
  end

  def percent_correct_by_category(category)
    if category_guessed(category).count == 0
      0
    else
      (number_correct_by_category(category).to_f / category_guessed(category).count) * 100
    end
  end

end

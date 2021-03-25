class Round

  attr_reader :deck,
              :turns,
              :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    turns_taken = @turns.length
    @deck.cards[turns_taken]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    turns << new_turn
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def list_categories
    category_list = deck.cards.map do |card|
      card.category
    end.uniq
    return category_list
  end

  def number_correct_by_category(category)
    total_for_category = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        total_for_category += 1
      end
    end
    return total_for_category
  end

  def percent_correct
    if @turns.length > 0
      ( @number_correct / @turns.length.to_f ) * 100.0
    else
      "No turns have yet been taken."
    end
  end

  def percent_correct_by_category(category)
    # num correct for category divided by num turns in category
    turns_in_category = 0
    @turns.each do |turn|
      if turn.card.category == category
        turns_in_category += 1
      end
    end
    correct_in_category = number_correct_by_category(category)
    if turns_in_category > 0
      (correct_in_category / turns_in_category.to_f ) * 100.0
    else
      "No turns in this category have yet been taken."
    end
  end
end

class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    turn_taken = Turn.new(guess, @current_card)
    @turns << turn_taken
    @current_card = @deck.cards[@turns.length]
    return turn_taken
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        number_correct += 1
      end
    end
    return number_correct
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
      if turn.correct? == true && category == turn.card.category
        number_correct_by_category += 1
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = 0
    @turns.each do |turn|
      if category == turn.card.category
        turns_in_category += 1
      end
    end

    number_correct_by_category(category).to_f / turns_in_category * 100
  end

end

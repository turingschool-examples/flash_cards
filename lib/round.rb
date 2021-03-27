class Round
  attr_reader :turns,
              :deck,
              :current_card_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_count = 0
  end

  def take_turn(guess)
    @guess = guess
    @new_turn = Turn.new(@guess, @deck.cards[@current_card_count])
    @current_card_count += 1
    @turns.push(@new_turn)
    @new_turn
  end

  def current_card
    @deck.cards[@current_card_count]
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category_to_count_correct)
    @category_to_count_correct = category_to_count_correct
    @category_cards_seen = @turns.select do |turn|
      turn.card.category == @category_to_count_correct
    end
    @category_correct = @category_cards_seen.count do |turn|
      turn.correct?
    end
    @category_correct
  end

  def percent_correct
    if @turns.count > 0
      @turns_guess_correct = @turns.count do |turn|
        turn.correct?
      end
      @turns_taken = @turns.count.to_f
      (@turns_guess_correct / @turns_taken) * 100
    else
      "error divide by zero"
    end
  end

  def percent_correct_by_category(category_percent_check)
    if @turns.count {|turn| turn.card.category == category_percent_check} > 0
      category_correct = number_correct_by_category(category_percent_check)
      category_seen = @turns.count {|turn| turn.card.category == category_percent_check}
      return (category_correct.to_f / category_seen) * 100
    else
      return "error divide by zero"
    end
  end
end

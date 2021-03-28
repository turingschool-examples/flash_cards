module NumberCorrect
  extend self
  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end
end

module NumberCorrectByCategory
  extend self
  def number_correct_by_category(category_to_count_correct)
    @category_to_count_correct = category_to_count_correct
    @category_cards_seen = turns.select do |turn|
      turn.card.category == @category_to_count_correct
    end
    @category_cards_seen.count do |turn|
      turn.correct?
    end
  end
end

module PercentCorrectByCategory
  def percent_correct_by_category(catagory_percent_check)
    @catagory_percent_check = catagory_percent_check
    @category_turn_deck = Deck.new(@turns)
    @category_percent_correct = @category_turn_deck.cards_in_category(@catagory_percent_check)
    @category_correct = @category_percent_correct.count do |turn|
      turn.correct?
    end
    @category_total = @category_turn_deck.count
    @category_percent_correct = (@category_correct / @category_total) * 100
  end
end

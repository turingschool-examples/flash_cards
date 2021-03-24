module NumberCorrect
  extend self
  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end
end

module NumberCorrectByCategory
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

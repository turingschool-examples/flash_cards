class Round 
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @index = 0
  end

  def current_card
    return @deck.cards[@index]
  end

  def take_turn(guess)
    result = Turn.new(guess, current_card)
    @turns << result
    @index += 1
    return result
  end

  def number_correct
    result = turns.select{|turn| turn.card.correct?}
    return result.length
  end

  def number_correct_by_category(category)
    result = turns.select{|turn| turn.card.correct? && (turn.card.category == category)}
    return result.length
  end
end
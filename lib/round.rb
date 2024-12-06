class Round 
  attr_reader :deck, :turns, :index

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
    result = turns.select{|turn| turn.correct?}
    return result.length
  end

  def number_correct_by_category(category)
    result = turns.select{|turn| turn.correct? && (turn.card.category == category)}
    return result.length
  end

  def percent_correct
      return (((number_correct.to_f) / (turns.length)) * 100)
  end

  def percent_correct_by_category(category)
      return (((number_correct_by_category(category).to_f) / ((turns.select{|turn| turn.card.category == category}).length)) * 100)
  end

end
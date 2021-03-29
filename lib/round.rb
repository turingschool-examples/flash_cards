class Round
  attr_reader :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[turns.length]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @turns.last
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

  def number_correct_by_category(category)
    @turns.count do |turn| 
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    turns.size == 0 ? 100 : ((number_correct.to_f / turns.size) * 100)
  end

  def number_turns_for_category(category)
    @turns.count { |turn| turn.card.category == category }
  end

  def percent_correct_by_category(category)
    correct_for_category = number_correct_by_category(category)
    if number_turns_for_category(category) > 0
      correct_for_category.to_f / number_turns_for_category(category) * 100
    else
      100
    end
  end
end
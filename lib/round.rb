class Round
  attr_reader :turns, :deck, :turn_number

  def initialize(deck)
    @turn_number = 0
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[@turns.length])
    @turns.last
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category }
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true }
  end

  def get_ratio(divisor, dividend)
    divisor / dividend.to_f * 100
  end

  def percent_correct
    get_ratio(number_correct, @turns.count)
  end

  def percent_correct_by_category(category)
    get_ratio(number_correct_by_category(category), @turns.count)
  end

  def current_card
    deck.cards[[@turns.length - 1, 0].max] # prevents negative index
  end
end

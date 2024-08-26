class Round
  attr_reader :turns, :deck, :turn_number

  def initialize(deck)
    @turn_number = 0
    @deck = deck
    @turns = []
  end

  def current_card_number
    @turns.length
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @deck.cards[current_card_number])
    @turns.last
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.card.category == category }
  end

  def number_correct
    @turns.count { |turn| turn.correct? == true }
  end

  def get_ratio(divisor, dividend)
    divisor / dividend * 100
  end

  def percent_correct
    get_ratio(number_correct, @turns.count.to_f)
  end

  def percent_correct_by_category(category)
    get_ratio(number_correct_by_category(category), @turns.count.to_f)
  end

  def current_card
    # length is +1 more then desired index. .max ensures that index is not -1
    deck.cards[[@turns.length - 1, 0].max]
  end
end

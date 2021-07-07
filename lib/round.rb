class Round
  attr_reader :guess, :category
  def initialize(deck)
    @deck = deck
  end

  def turns

  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)

  end

  def correct?

  end

  def number_correct
    if @guess == card.answer
      i += 1
    end
  end

  def number_correct_by_category

  end

  def percent_correct
    (number_correct/deck.count) * 100
  end

  def percent_correct_by_category

  end

end

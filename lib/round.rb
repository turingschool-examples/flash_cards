class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
  end

  def number_correct
  end

  def number_correct_by_category(category)
  end

  def percent_correct
  end

  def percent_correct_by_category(category)
  end
end

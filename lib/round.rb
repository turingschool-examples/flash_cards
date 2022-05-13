class Round

  attr_reader :deck, :card, :turn, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turn = Turn.new(guess, card)
    @turns << @turn
    return @turn
  end

  def current_card
    @deck.cards.first
  end

  def number_correct
  end

  def number_correct_by_category(category)
  end

  def percent_correct
  end

  def percent_correct_by_category
  end

end

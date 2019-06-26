class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    #deck.cards[0]
  end

  def next_card
    #deck = deck.cards.rotate
  end

  def take_turn(guess)
    # this_turn = Turn.new(guess, current_card)
    # turns << this_turn
    # next_card
    # this_turn
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

class Round
  attr_accessor :deck, :guess

  def initialize(deck)
    @deck = deck
    @guess
  end

  def turns
    turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @guess = guess
  end

  def new_turn
  end

  def number_correct
  end

  def number_correct_by_category
  end

end

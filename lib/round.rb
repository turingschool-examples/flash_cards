class Round
  attr_reader :deck,
              :current_card,
              :number_correct,
              :guesses

  def_initialize(deck)
    @deck = deck
    @current_card = 0
    @total_cards = 4
    @guesses = []
    

  end

  def take_turn
  end

  def turns
  end

  def next_card
  end

  def number_correct_by_category
  end

  def percent_correct
  end

  def percent_correct_by_category
  end

  def current_card
  end

end

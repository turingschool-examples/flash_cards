class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def current_card
    @current_card[] = @deck.cards[0]
    @deck.cards[0]
  end

  def turns
    @turns = []
  end

  # def take_turn(guess)
  #   @turns = @current_card << guess
  # end



end

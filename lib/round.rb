class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  # def current_card
  #   @current_card = @deck(0)
  # end
  def turns
    @turns = []
  end

  # def take_turn(guess, current_card)
  #   @turns = [guess << card]
  # end



end

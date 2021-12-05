class Round
 attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def turns
    return []
  end

  def current_card
  end

  # def take_turn(guess)
  #   turn = Turn.new(guess, card)
  #
  #   return turn
  # end
end

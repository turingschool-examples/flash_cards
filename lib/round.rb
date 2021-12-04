
class Round

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    return deck.cards[0]
  end

  def take_turn(guess)
    return turn = Turn.new(guess, current_card)
  end


end

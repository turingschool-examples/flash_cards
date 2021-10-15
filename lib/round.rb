
class Round

  attr_accessor :deck


  def initialize(deck)
    @deck = deck
    @turn = []
    @correct = 0
  end

  def turns
    @turn
  end

  def current_card
    deck.cards.first

  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turn << new_turn
    deck.cards.rotate!
  end
end

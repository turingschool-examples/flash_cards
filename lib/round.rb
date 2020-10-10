class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    deck.cards[@turns.length]
  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  @turns.last
  end



end

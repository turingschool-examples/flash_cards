class Round
  attr_reader :deck, :turns

  def initialize(round_deck)
    @deck = round_deck
    @turns = []
  end

  def current_card
    deck.draw
  end

  def take_turn(guess)
    Turn.new(guess, current_card)
  end
end

class Round
  attr_reader :deck, :turns

  def initialize(round_deck)
    @deck = round_deck
    @turns = []
  end

  def current_card
    deck.draw
  end
end

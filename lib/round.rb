class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card
  end
end
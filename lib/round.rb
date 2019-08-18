class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck_param)
    @deck = deck_param
    @turns = []
    @current_card = deck_param.cards_in_deck.first
  end
end

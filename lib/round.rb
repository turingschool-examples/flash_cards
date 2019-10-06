class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    player_turn = Turn.new(guess, current_card)
    @turns << player_turn
    # @deck.cards.shift
    player_turn
  end
end

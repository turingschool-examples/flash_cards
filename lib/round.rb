class Round

attr_reader :deck,
            :turns

  def initialize(deck)
    @deck      = deck
    @turns      = []
  end

  def current_card
    current_card = @deck.cards.first
  end

  def take_turn(guess)
    container = Turn.new(guess, current_card)
    @turns << container
    deck.cards.rotate()
    return container
  end

end

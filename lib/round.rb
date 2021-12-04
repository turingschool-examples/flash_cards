class Round

attr_reader :deck,
            :turn

  def initialize(deck)
    @deck      = deck
    @turn      = []
  end

  def current_card
    current_card = @deck.cards.first
  end

  def take_turn(guess)
    container = Turn.new(guess, current_card)
    @turn << container
    deck.cards.shift()
    return container
  end

end

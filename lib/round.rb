class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, @current_card)
    @deck.cards.shift
    @current_card = @deck.cards[0]

    @turns.last
  end
end
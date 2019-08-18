class Round
  attr_reader :deck, :turns, :number_correct, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @number_correct = 0
  end

  def take_turn(guess)
    turns << Turn.new(guess, current_card)
    deck.cards = deck.cards.rotate
    @current_card = @deck.cards[0]
    turns.last
  end
end

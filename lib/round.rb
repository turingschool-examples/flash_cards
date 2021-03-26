class Round

  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
  card = current_card
  turn = Turn.new(guess, card)
  end

  def next_turn(turn)
    @turns << turn
    deck.cards.shift
  end

end

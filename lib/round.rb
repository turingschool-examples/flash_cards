class Round

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    self.deck.cards.first
  end

  def next_card
    self.deck.cards.shift
  end

  def take_turn(guess)
    card = self.current_card
    turn = Turn.new(guess, card)
    @turns << turn
    self.next_card
  end

end

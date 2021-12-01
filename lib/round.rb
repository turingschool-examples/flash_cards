class Round
  attr_reader :turns, :deck, :cards, :card_counter
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_counter = 0
  end


  def take_turn(guess)
    new_turn = Turn.new(guess, self.deck.cards[self.card_counter])
    @turns.push self.deck.cards[self.card_counter]
  end


end

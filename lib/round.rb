class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    card = deck.cards[0]
    turn = Turn.new(guess, card)
  end


  # def turns
  #
  # end
  #
end

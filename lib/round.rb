class Round

  attr_reader :deck, :round, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)


    @turns << current_card



  end

end

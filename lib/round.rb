class Round

  attr_reader :deck, :turns, :current_card, :cards

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end


  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    turn
  end

  def cards()
    @deck.class
  end

end

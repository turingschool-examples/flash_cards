class Round
  attr_reader :deck, :turns

  @@rounds = Set.new

  def initialize(deck)
    @deck = deck
    @turns = []
    @@rounds << self
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    check_guess
  end

end

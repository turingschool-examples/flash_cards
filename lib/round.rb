class Round
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    @current_card = @deck.cards[0]
    @deck.cards[0]
  end

  def turns
    @turns = []
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
  end

 binding.pry


end

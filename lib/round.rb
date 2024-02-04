class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
      @deck.cards.first
  end

  # def take_turn(guess)
  # Create a turn object with guess
  # Card should be current card
  #   text
  # end



end

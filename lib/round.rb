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
    new_turn = Turn.new(guess, current_card)
    # new_turn = []
    # # require "pry"; binding.pry
    #   @cards.each do |card|
    #   new_turn += card
    #   end
    # new_turn
    require "pry"; binding.pry
  end
end

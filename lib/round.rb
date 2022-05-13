class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end

  def current_card
    deck.cards[0]
  end




  # def count
  #   require "pry"; binding.pry
  #
  # end
  #
  # def take_turn
  #
  # end

end

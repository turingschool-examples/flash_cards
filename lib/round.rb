class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end
  
  # def advance_card
  #   require 'pry'; binding.pry
  #   @deck.cards.rotate!
  # end
  
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    # require 'pry'; binding.pry
    # advance_card
    @deck.cards.rotate!
    new_turn
  end
end
require './lib/turn'

class Round
  attr_reader :deck, :turns
  def initialize (deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0 + @turns.count]
  end



  # def take_turn(guess)
  # @turns << Turn.new(guess, current_card)
  # @turns.last
  # end
end

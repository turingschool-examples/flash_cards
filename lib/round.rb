class Round
  attr_reader :deck, :turns, :cards, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @cards = cards
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

 def take_turn(guess)
   new_turn = Turn.new(guess, current_card)
   @turns << new_turn
   @current_card += 1
   return new_turn
 end
end

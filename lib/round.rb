
class Round 
  attr_reader :current_card, :turns, :deck, :count

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @current_card = deck.cards[@current_card_index]
    @turns = []
  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    @turns << @turn
    @current_card_index += 1
    @current_card = deck.cards[@current_card_index] if @current_card_index < deck.cards.length
    @turn
  end 


end 

class Turn 

  def initialize(guess, card)
    @card = card
    @guess = guess
  end  

end 
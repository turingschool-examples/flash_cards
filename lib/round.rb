# attr_reader :round
class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  
    #instance variable
  end


def current_card
  @deck.cards[0]
end

def take_turn(guess)
  # require 'pry';binding.pry
    new_turn = Turn.new(guess, current_card)
  
end


  # def current_card

  # end

  # def number_correct
    
  # end
end
class Round
  attr_accessor :deck, :turns, :cards, :guess, :annswer
  def initialize(deck)
    @deck = deck
    @turns = []
  end

def current_card
  deck.cards[0]
end

def take_turn(guess)
  this_turn = Turn.new(guess, current_card)
  @turns << this_turn
end

def number_correct
  

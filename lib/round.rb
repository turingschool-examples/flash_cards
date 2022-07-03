require 'pry'
#the purpose of Round is to record guesses & process reponses
class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  # #the following method is going to be called on a Turn object
  # #& here it should reveal the status of take_turn
  #   def take_turn(string_as_guess)
  #     new_turn = Turn.new(string_as_guess, card)
  #     deck.turns
  #     new_turn
  #   end


end

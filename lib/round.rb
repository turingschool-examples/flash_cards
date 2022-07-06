require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

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

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new(cards)
round = Round.new(deck)

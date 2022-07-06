require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'

#the purpose of Round is to record guesses & process reponses
class Round
  attr_accessor :turns, :deck, :current_card

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = []
  end

  def take_turn(string_as_guess)
    #A turn object looks like this
    #turn = Turn.new("Juneau", card)
    @turns << [string_as_guess, round.current_card]
  end


end

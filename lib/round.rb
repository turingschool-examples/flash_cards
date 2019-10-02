require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_accessor :turns, :deck

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    test_array = []
    @deck.cards.each { |card| test_array << card }
    test_array[@turns]
  end

  def take_turn(guess)
    
  end




end

require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_accessor :turn

  def initialize(deck)
    @deck = deck
  end

  def deck
    @deck
  end

  def current_card

  end

  def turns
  end

  def take_turn(guess)

  end




end

require 'pry'
require './card'
require './turn'
require './deck'

class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card) #create a turn
    @turns << turn                       # put turn into turns array
    @deck.cards.shift                    # discard "current card"
    turn                                 # return new turn
  end

  def number_correct
    @turns.each do |turn|
      
    end
  end

end

class Turn
  require 'pry'
  require './lib/card'
  attr_accessor :guesses, :cards, :correct
  def initialize(guesses, cards)
    @guesses = guesses
    @cards = cards
    @correct
  end
  def guess
    guesses
  end
  def card
    cards
  end

  def correct?
    if card.answer == @guesses
      @correct = true
    else
      @correct = false
  end
  end

  def feedback
    correct?
    if @correct == true 
      "Correct!"
    else
      "Incorrect!"
    end
  end
end

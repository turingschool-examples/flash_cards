# turn.rb
require_relative 'card'
class Turn
  attr_accessor :guess, :card, :correct

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase.capitalize == card.answer.downcase.capitalize ? true : false
  end

  def feedback?
    if correct? == true
      'Correct'
    else
      'Incorrect'
    end
  end
end

#require 'pry'; binding.pry

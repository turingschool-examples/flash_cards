require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'


class Turn
  attr_reader  :card
  attr_accessor :correct, :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
    @correct = false
  end


  def correct?
    @guess == @card.answer
    @correct = true
  end

  def feedback
    if @correct == true
      puts "Correct!"
    else
      puts "Sorry, that is incorrect."
    end
  end

end

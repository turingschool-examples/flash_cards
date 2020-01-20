require_relative 'card.rb'

class Turn
  attr_accessor :guess, :card
  def initialize(string, card)
    @guess = string
    @card = card
    @correct = (@guess == @card.answer)
  end

  def correct?
    @correct
  end

  def feedback
    if @correct == true
      "Correct!"
    elsif @correct == false
      "Incorrect."
    end
  end 

end

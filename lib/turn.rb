require './lib/card'

class Turn < Card
  attr_accessor :answer, :card, :correct

  def initialize(answer, card)
    @answer = answer
    @card = card
    @correct = false
  end

  def guess
    #puts "Answer: #{@answer}"
    guess = @answer #gets.chomp
  end

  def card
    @card.question
  end

  def correct?
    @correct = guess == @card.answer
  end

  def feedback
    if @correct == true
      "Correct!"
    else
      "Incorrect. Try Again."
    end
  end

end

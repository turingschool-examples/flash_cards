require './lib/card'

class Turn

  attr_accessor :answer, :card

  def initialize(answer, card)
    @answer = answer
    @card = card
  end

  def guess
    puts "Answer: #{@answer}"
    guess = @answer #gets.chomp
  end

  def card
    puts @card.question
  end

  def correct?
    match = guess.chomp.downcase == @card.answer.downcase
  end

  def feedback
    if match == true
      "Correct!"
    else
      "Incorrect. Try Again."
    end
  end

end

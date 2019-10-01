require './card.rb'

class Turn
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    puts @guess
  end

  def card
    puts @card
  end

  def correct?
    correct = @guess == @card.answer
  end

  def feedback
     if correct
       puts "Correct!"
     else
       puts "Incorrect."
     end
  end
end

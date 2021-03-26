require 'pry'
class Turn
  attr_accessor :guess,
                :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      puts true
    end
  end

  def feedback()
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
   # binding.pry
end

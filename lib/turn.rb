require './card'

class Turn
  attr_reader :guess, :card, :answer

  def initialize(string, card)
    @guess = string
    @card = card
    @answer = card.answer
  end

  def correct?
    @guess == @answer
  end

  def feedback
    if @guess == @answer
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end

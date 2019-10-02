require './lib/card'

class Turn
attr_reader :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def card
    @card
  end

  def correct?
    if @card.answer == self.guess
      return true
    elsif @card.answer != self.guess
      return false
    else
      puts "strange condition reached"
    end
  end

  def feedback
    if self.correct? == true
      return "Correct"
    elsif self.correct? == false
      return "Incorrect"
    end
  end

end

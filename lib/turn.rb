# 1 need to create turn class
#   1.1 initialize with (string, card)
#   1.2 method that returns the guess
#   1.3 method that returns the card
#   1.4 method that returns a boolean (true or false)
#   1.5 feedback method returns "Correct!" or "Incorrect."

class Turn
  attr_accessor(:string, :card, :answer)

  def initialize (string, card)
    @string = string
    @card = card
    @answer = card.answer #call up the answer???
  end

  def guess #not working: porque?
    puts @string
  end

  def card # not working: porque?
    puts @card
  end
  def correct?
    if @guess == @card.answer
      p true
    elsif @guess != @card.answer
      p false
    end
  end

  def feedback
    if correct? == true
      p "Correct!"
    elsif correct? == false
      p "Incorrect."
    end
  end
end

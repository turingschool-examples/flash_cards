class Turn
  attr_reader :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess.downcase == card.answer.downcase
  end

  def feedback
    if correct? #Implicitly returns boolean based on correct? method on line 10
      "Correct!" #if true, returns "Correct!"
    else
      "Incorrect!" #if false, returns "Incorrect!"
    end
  end
end

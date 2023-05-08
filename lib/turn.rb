class Turn
  attr_reader :guess, :card
  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    if correct? 
      "Correct!" 
    elsif guess.class != card.answer.class
      "Incorrect. You entered a #{guess.class}, please enter in #{card.answer.class} format."
    else
      "Incorrect."
    end
  end
end
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if guess == card
      return true
    else
      return false
    end
  end

  def feedback
    if guess == true
      return "Correct!"
    elsif guess == false
      return "Incorrect."
    else
      return "Invalid Input"
    end
  end
end

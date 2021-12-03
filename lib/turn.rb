class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
  end

  def correct?
    if guess == card
      return true
    else
      return false
    end
  end

  # def feedback
  #   if guess == true
  #     return "Correct!"
  #   else
  #     return "Incorrect."
  # end
end

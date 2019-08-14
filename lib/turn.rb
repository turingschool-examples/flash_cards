# creates a Turn class
class Turn
  # attributes and attribute reader
  attr_reader :guess, :card

  # initialization method and parameters
  def initialize(string, card)
    # attributes
    @guess = string
    @card = card
  end

  # define method to check for correctness
  def correct?
    # checks if the guess is equivalent to the cards answer and return a bool
    @guess == @card.answer
  end

  # define method for feedback
  def feedback
    # check to see if correct is true
    if correct?
      # if correct is true return "Correct!"
      "Correct!"
    # or else return "Incorrect."
    else
      "Incorrect."
    end
  end

end

class Turn
  attr_reader :guess, :card
  # Note that get methods for the above attributes get created
  # when attr_reader is called, and thus satisfy the project method requirements.


  def initialize(user_guess, current_card)
    @guess = user_guess
    @card = current_card

  end

  # This method used an if/else statement, but not necessary...
  # ... since comparison will return true/false anyway.
  def correct?
    @card.answer == @guess
  end

  def feedback
    correct_response = "Correct!"
    incorrect_response = "Incorrect."

    # Explicitly returning variables for testing purposes only--
    # --not needed to run program at all.
    if self.correct? # the == true comparison is superfluous
      puts correct_response
      return correct_response
    else
      puts incorrect_response
      return incorrect_response
    end
  end

end

class Turn
  # Note that get methods for these attributes get created
  # when attr_reader is called, and thus satisfy the project method requirements.
  attr_reader :guess, :card

  def initialize(user_guess, current_card)
    @guess = user_guess
    @card = current_card
  end


  # This method previously used an if/else statement, but not necessary
  # Comparison will inherently return a true/false value
  def correct?
    @card.answer == @guess
  end


  def feedback
    correct_response = "Correct!"
    incorrect_response = "Incorrect."

    # Returning variables instead of outputting
    # I utilize #puts in the Round class which
    # outputs the response to user.
    if self.correct? # the == true comparison is superfluous
      correct_response
    else
      incorrect_response
    end
  end

end

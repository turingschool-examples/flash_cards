class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
   @guess == @card.answer
  end

  def feedback
    # correct? ? 'Correct!' : 'Incorrect.'
    if correct? == true
      return 'Correct!'
    elsif correct? == false
      return 'Incorrect.'
    end
    ## CHECK THIS OUT LATER!!!!!!!!(Ask during project check in)
    # correct?
    # if true
    #   return 'Correct!'
    # elsif false
    #   return 'Incorrect.'
    # end
  end

end

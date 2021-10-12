class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == @card.answer
      true
    else
      false
    end
  end

  def feedback
    if @guess == @card.answer
      return 'Correct!'
    else
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

class Turn



  attr_reader :obj_guess, :obj_card

  def initialize(string, card) # Creating internal variables
    @obj_guess = string
    @obj_card = card
  end

  def card # Card method returns the value 'card', not the method 'card'
    self.obj_card
  end

  def guess
    self.obj_guess
  end

  def correct?
    if guess == card.answer # Compare internal 'string' variable to our inputted object's 'answer' variable
      true
    else
      false
    end
  end

  def feedback # Uses the '.correct?' class method for feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end



end

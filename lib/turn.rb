class Turn
  attr_accessor :string, :card

  def initialize(string, card) # Creating internal variables
    @string = string
    @card = card
  end

  def card=(card) # Card method returns the value 'card', not the method 'card'
    self.card
  end

  def guess
    self.string
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

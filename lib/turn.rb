class Turn
  attr_accessor :string, :card

  def initialize(string, card)
    @string = string.capitalize
    @card = card
  end

  def guess
    @string = "Variable"
  end


  def correct?
    if guess == "Variable"
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect!"
    end
  end


end

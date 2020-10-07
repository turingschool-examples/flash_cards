class Turn
  attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess.capitalize
    @card = card
  end

  def guess
    @guess
  end

  def category
    @category
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

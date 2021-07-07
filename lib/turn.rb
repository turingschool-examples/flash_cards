class Turn

  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def card
    @card
  end

  # checks whether or not the guess string matches the answer in the Card object
  def correct?
    if @string == @card.answer
      return true
    else
      return false
    end
  end

  # provides answer feed back based on correct? method boolean value
  def feedback
    if correct? == true
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end

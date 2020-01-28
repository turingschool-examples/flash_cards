class Turn
  attr_accessor :string, :card

  def initialize(string, card)
    @string = string
    @card = Card
  end

  def guess(@string)
    return
  end

  def card(@card)
    return
  end

  def correct?
    return @string == @answer
  end

  def feedback
    if @string == @answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end

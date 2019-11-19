class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    p "#{@string}"
  end

  def correct?
    if @string.downcase == card.answer.downcase
      true
    else
      false
    end
  end

  def feedback
    if @string.downcase == card.answer.downcase
      p "Correct!"
    else
      p "Incorrect."
    end
  end

end

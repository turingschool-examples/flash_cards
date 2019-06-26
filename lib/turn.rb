class Turn
  attr_reader :string, :card

  def initialize (string, card)
    @string = string
    @card = card
  end

  def guess
    return "#{string}"
  end

  def self.card
    return "#{card}"
  end

  def correct?
      @string == @card.answer
  end

  def feedback
    if @string == @card.answer
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end

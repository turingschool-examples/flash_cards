class Turn
  attr_reader :string, :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    p "#{@string}"
  end

  def card
    p "#{card}"
  end

  def correct?
    if @string.downcase == card.downcase
      p true
    else
      p false
    end
  end

  def feedback
    if @string.downcase == card.downcase
      p "Correct!"
    else
      p "Incorrect."
    end
  end

end

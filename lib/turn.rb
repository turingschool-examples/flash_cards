class Turn
  attr_reader :string, :card

  def initialize (string, card)
    @string = string
    @card = card
  end

  def guess
    return "#{string}"
  end

  def card
    return "#{card}"
  end

  def correct?
      @string == @card.answer
  end

  def feedback
    if @string == @card
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end

end

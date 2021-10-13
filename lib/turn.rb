class Turn
  def initialize(string, card) #
    @string = string
    @card = card
  end

  def guess
    @string
  end

  def card
    @card
  end

  def correct?
    if @string == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end

class Turn

  attr_accessor :string
  attr_reader :card

  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    p @string
  end

  def card
    p @card
  end

  def correct?
    if @string == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @string == @card.answer
      puts "Correct!"
    else
      puts "Incorrect"
    end
  end

end

class Turn
  attr_accessor :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    puts @string
  end

  def card
    puts @card
  end

  def correct?
    return true if @string == card.answer
    false
  end

  def feedback
    if turn.correct? = true
      puts "Correct!"
    else
      puts "Incorrect"
  end
  
end

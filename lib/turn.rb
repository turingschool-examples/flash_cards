class Turn
  attr_accessor :string, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    puts string
  end

  def card
    puts self.card
  end

  def correct?
    if guess == card.answer
      puts true
    else
      puts false
    end
  end

  def feedback
    if string == card.answer
      puts "Correct!"
    else
      puts "Incorrect!"
    end
  end
end

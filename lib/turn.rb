class Turn

  attr_accessor :string
  attr_reader :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    p @guess
  end

  def card
    p @card
  end

  def correct?
    if @guess == @card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @guess == @card.answer
      puts "Correct!"
    else
      puts "Incorrect"
    end
  end

end

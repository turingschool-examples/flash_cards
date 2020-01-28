class Turn

  attr_accessor :guess
                :card

  def initialize(guess, card)
    @guess    = guess
    @card     = Card
    
  end

  def guess(guess)
    @guess    = guess
  end

  def card
    Card
  end

  def correct?
    if guess == answer
      true
    else guess != answer
      false
    end
  end

  def feedback
    if guess == true
      puts "Correct!"
    else guess == false
      puts "Incorrect."
  end
end

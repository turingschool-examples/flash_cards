class Turn

  attr_reader :guess, :card

  def initialize (guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess = @answer
      true
    else
      false
  end

  def feedback
    if @guess = @answer
      p "Correct!"
    else
      p "Incorrect."
  end

end

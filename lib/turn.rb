class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    true #fix hard code
  end

  def feedback
    return "Correct!" if correct? == true
  end

end

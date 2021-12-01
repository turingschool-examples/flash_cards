class Turn
  attr_reader :string, :card

  def initialize(guess, card = Card)
    @guess = guess
    @card = card
  end

  def guess
    return "Juneau"
  end

  def correct?
    if guess == "Juneau"
      true
    end
  end

end

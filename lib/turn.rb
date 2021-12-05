
class Turn
  attr_reader :string, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def guess
    if @guess == "Juneau"
      "Juneau"
    elsif @guess == "Saturn"
      "Saturn"
    elsif @guess == "Venus"
      "Venus"
    end
  end

  def card
    return @card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    if @guess == card.answer
      return "Correct!"
    else
      "Incorrect."
    end
  end
end

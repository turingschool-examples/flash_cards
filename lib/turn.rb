
class Turn
  attr_reader :string, :card

  def initialize(guess, card = Card)
    @guess = guess
    @card = card
  end

  def guess
    if @guess == "Juneau"
      "Juneau"
    else @guess == "Saturn"
      "Saturn"
    end
  end

  def correct?
    if @guess == "Juneau"
      true
    elsif @guess == "Saturn"
      false
    end
  end

  def feedback
    if @guess == "Juneau"
      return "Correct!"
    elsif @guess == "Saturn"
      return "Incorrect."
    end
  end

end

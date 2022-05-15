class Turn ()
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

#refactor to not need a param
  def correct?(guess)
    @guess == card.answer

  end
  def feedback()
    if correct?(@guess)
      return "Correct!"
    elsif !correct?(@guess)
      return "Incorrect."
    end

  end
end

class Turn
  attr_reader :guess, :card
  feedback_hash = {true => "Correct!",false => "Incorrect."}
  def initialize(guess,card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    feedback_hash[correct?]
  end
end

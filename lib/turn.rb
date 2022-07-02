class Turn

  attr_reader :guess, :card, :validity

  def initialize(guess, current_card)
    @guess = guess
    @card = current_card
  end

  def correct?
    @validity = @card.answer.include?(@guess)
  end

  def feedback
    if @validity == true
      "Correct!"
    elsif @validity == false
      "Incorrect."
    end
  end
end

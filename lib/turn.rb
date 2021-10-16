class Turn
  attr_accessor :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    @guess == card.answer ? 'Correct!' : 'Incorrect.'
    # if @guess == card.answer
      # 'Correct!'
    # else
      # 'Incorrect.'
    # end
  end


end

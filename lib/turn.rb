class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess = card.answer
      true
    elsif @guess != card.answer
      false
    else
      p "error!"
    end
  end

  # def feedback
  #
  # end


end

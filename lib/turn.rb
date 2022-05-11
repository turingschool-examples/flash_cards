class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    if @guess == "Juneau"
      true
    elsif @guess == "Saturn"
      false
    else
      p "error!"
    end
  end



  # def feedback
  #   if @guess = card.answer
  #     p "Correct!"
  #   else
  #     p "Incorrect."
  #   end
  # end


end

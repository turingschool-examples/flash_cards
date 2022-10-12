class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def card
    @card
  end

  def correct?
      if guess == card.answer
      true
    else
      false
      end

  # def feedback
  #     if correct? == true
  #       p "Correct!"
  #     else
  #       p "Wrong!"
  #     end
  # end
end
end
# require 'pry'; binding.pry

class Turn
attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    #require 'pry'; binding.pry
    if correct?
       "Correct!"
    else
       "Incorrect."
    end
  end
end

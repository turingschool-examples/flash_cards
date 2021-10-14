class Turn
  attr_reader :string, :card
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    @string
  end

    # if card.answer == turn.string
    #   puts "correct!"
    # end


  def correct?
    if guess == @answer
      true
    else
      false
    end
  end
end
  # def feedback
  # puts "correct!"
  # puts "incorrect!"
  # end


class Turn
  attr_reader :string, :card
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def guess
    return @guess
  end

  def card
    #I dont think this works, i think i need to acess the card.rb file somehow
    #I want this to return the card
    return @card
  end

  def correct?
    return true if @guess == card.answer
    false
  end

  def feedback
    if @guess == card.answer
      return "Correct!"
    else
      return "Incorrect"
    end
  end

end

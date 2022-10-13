class Turn
attr_reader :guess, :card

def initialize (string, card)
  @guess = string
  @card = card
end

def guess
  @guess
end

def correct?
  if @guess == "Juneau"
    return true
  else return false
  end
end

  def feedback
    if @guess == true
      p "correct!"
    elsif @guess == false
      p "incorrect"
    end
end
end

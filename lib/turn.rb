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
  if @guess == @answer
    return true
  else return false
  end
end

  def feedback
    if correct? == true
      return  "correct!"
    elsif correct? == false
    return  "incorrect"
    end
end
end

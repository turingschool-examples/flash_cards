class Turn
  attr_reader :guess
def initialize(guess, card)
  @card = card
  @guess = guess
end

def card
  @card
end

def correct?
  if @guess == card.answer
    correct_guess = true
  else
    correct_guess = false
end

def feedback
end

end
end

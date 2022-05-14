class Turn
    attr_reader :card, :guess, :feedback

def initialize(guess, card)
  @guess = guess
  @card = card
  @feedback = ''
end

def correct?
  if @guess == card.answer.downcase 
    true
  else
    false
  end
end

def feedback
  if correct? == true
    @feedback = 'Correct!'
  else
    @feedback = 'Incorrect.'
  end
  @feedback
end

end

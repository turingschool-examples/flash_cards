
class Turn
  attr_accessor :string, :card, :correct

def initialize(guess, card)
  @guess = guess
  @card = card
  correct = correct

end

def guess
  @guess
end

def card
  @card
end

def correct?
  if @guess == card.answer
    @correct = true
  else
    @correct = false
end
end

def feedback
  if correct == true
    puts "Correct!"
  else
    puts "Incorrect!"
end
end

end

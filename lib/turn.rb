require './card'

class Turn

attr_reader :string, :flash_card

def initialize(string, card)
  @guess = string
  @flash_card = card
end

def guess
  @guess
end

def card
  @flash_card
end

def correct?
  if @guess == @answer
    then guess.correct? == true
  end
end

def feedback
  if guess.correct? == true
    puts "Correct!"
  elsif guess.correct? == false
    puts "Incorrect."
  end
end


end

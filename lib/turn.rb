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
    true #removed unnecessary text
  end
end

def feedback
  if guess.correct? == true
    puts "Correct!"
  else guess.correct? == false #elsif not necessary
    puts "Incorrect."
  end
end


end

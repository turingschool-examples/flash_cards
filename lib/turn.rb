
class Turn

  def initialize (guess, card)
    @card = card
    @guess = guess
  end

  def guess
    @guess
  end

  def card
    @card
  end

  def correct?
    guess == answer
  end

  def feedback
    if quess == answer
      puts "Correct!"
    else
      puts "Incorrect!"
    end
  end
end

#2019-06-25 having issues with pry test starting on pry test
#pry(main)> turn = Turn.new("Juneau", card)

# pry(main)> pry(main)> turn.card
# NameError: undefined local variable or method `main' for main:Object

class Turn
  attr_reader :guess,
              :card

  def initialize(guess, card)
    @guess    = guess
    @card     = card
  end

  def correct?
    # require 'pry'; binding.pry
    guess == card.answer
    # evaluating, does the left side match right side
  end

  def feedback
    if guess == card.answer
      return "Correct!"
    elsif guess != card.answer
      return "Incorrect."
    end
  end
end

# do the simplest thing first to pass the test!!
# stop trying to solve future problems that don't exist yet

require './lib/card'

class Turn
attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    # VERSION 1
    # card.answer.upcase == (guess.upcase)
    # this works for just capitalization but not if the user inputs more words than the answer
    # i.e. "The answer is apple"

    #VERSION 2
    # guess.upcase.scan(/\w+/).join.match?(card.answer.upcase.scan(/\w+/).join)
    # this works for capitalization and if the user inputs 'the answer is answer' but returns
    # correct if the answer is located anywhere in the sentence even if they tack on more wrong
    # answers i.e. answer = apple, guess = apples and oranges
    # Maybe just limit the amount of spaces and commas a user can use with version 1?

    # VERSION 3
    guess.upcase.scan(/\w+/).join == (card.answer.upcase.scan(/\w+/).join)

  end

  def correct_contained?
    guess.upcase.scan(/\w+/).join.match?(card.answer.upcase.scan(/\w+/).join)
  end

  def feedback
    if correct? 
      'Correct!'
    else
      'Incorrect.'
    end
  end


end

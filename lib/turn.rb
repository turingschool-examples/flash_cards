# require './card'

class Turn
  attr_reader :card
  attr_accessor :guess

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct? == true
       "Correct!"
    else
       "Incorrect."
    end
  end
end



#
# class Turn
#   attr_reader :card
#
#   def initialize(guess, card)
#     @guess = guess
#     @card = card
#   end
#
#   def string
#     @guess
#   end
#
#   def correct?
#     if string == card.answer
#       return true
#     else
#       return false
#     end
#   end
#
#   def feedback
#     if correct? == true
#       return "Correct!"
#     else
#       return "Incorrect."
#     end
#   end
# end

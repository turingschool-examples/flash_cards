
require './lib/card'
require 'pry'
class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == @card.answer
    # why does it have to be @card.answer?
  end

  def feedback
    if correct? == false
      "Incorrect."
    elsif correct? == true
       "Correct!"
    end
  end
end

# card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# turn = Turn.new("Anchorage", card)
# turn_2 = Turn.new("Juneau", card)
# turn.feedback



# if turn.correct? != @guess
#     puts "Incorrect."
#   elsif turn_2.correct? == @guess
#     puts "Correct!"
# end

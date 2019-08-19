require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Flashcard_runner

  def initialize(argument)
    @argument = argument
  end

  @round = Round.new(@deck)

  puts Welcome! You're playing with 5 cards.
  puts "-" * 50

end

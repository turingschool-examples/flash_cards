require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class Game
  attr_reader :round
  def initialize(round)
    @round = round
  end
  def start
    puts "Welcome! you're playing with #{round.deck.count} cards"
    puts '-'*45
    puts "This is card #{round.turns.count+1} out of #{round.deck.count} "
    puts "Question: #{round.current_card.question}"
  end
end

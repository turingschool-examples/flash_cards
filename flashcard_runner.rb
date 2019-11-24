require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card1 = Card.new("Who was the first President of the United States?", "George Washington", :History)
@card2 = Card.new("Who was the NBA regular season MVP in 2011?", "Derrick Rose", :Sports)
@card3 = Card.new("What is the state capitol of Michigan?", "Lansing", :Geography)
@card4 = Card.new("How many teams are currently in the NFL?", "32", :Sports)
@cards = [@card1, @card2, @card3, @card4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@deck.count} cards."
  puts "---" * 22

  until @deck.count == @round.turns.count + 1

    puts "This is card number #{@round.turns.count + 1} out of #{@deck.count}."
    puts "Question: #{@deck.cards.first.question}"
# get user input and check against current cards
    @round.take_turn(gets.chomp.to_s)
    puts " #{@round.deck.last.feedback}"


  end


end


start

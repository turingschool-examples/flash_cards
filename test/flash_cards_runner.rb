require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

@card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card2 = Card.new("What is my name?", "David", :Personal)
@card3 = Card.new("What is 30 * 30", "900", :Math)
@card4 = Card.new("What is the mile high city", "Denver", :Geography)
@cards = [@card1, @card2, @card3, @card4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
  puts ""
  puts "Welcome you're playing with #{@round.deck.count} cards."
  puts "-------------------------------------------------------"
  while @round.deck.count > 0 do
    puts "This #{1 + @round.turns.count} out of #{@round.turns.count + @round.deck.count}"
    puts "Question: #{@round.deck.cards[0].question}"
    answer = gets.chomp
    @round.take_turn(answer)
    puts "#{@round.turns.last.feedback}"
    puts ""
  end
  puts "******** GAME OVER ********"
  puts "You had #{@round.number_correct} out of #{@round.turns.count} correct for a total score of #{@round.percent_correct}%"
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}"
  puts "Personal - #{@round.percent_correct_by_category(:Personal)}"
  puts "Math - #{@round.percent_correct_by_category(:Math)}"
  puts ""
end

start

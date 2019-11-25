require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card1 = Card.new("Who was the first President of the United States?", "George Washington", :History)
@card2 = Card.new("Who was the NBA regular season MVP in 2011?", "Derrick Rose", :Sports)
@card3 = Card.new("What is the state capitol of Michigan?", "Lansing", :Geography)
@card4 = Card.new("How many teams are currently in the NFL?", "32", :Sports)
@cards = [@card1, @card2, @card3, @card4]
@cards_count = @cards.count
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@cards_count} cards."
  puts "---" * 22

  until @round.turns.count == @cards_count

    puts "This is card number #{@round.turns.count + 1} out of #{@cards_count}."
    puts "Question: #{@deck.cards.first.question}"
# get user input and check against current cards
    @round.take_turn(gets.chomp)
    @round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{@round.number_correct} correct guesses out of #{@cards_count} for a total score of #{@round.percent_correct}%."

  puts "History - #{@round.percent_correct_by_category(:History)}% correct"
  puts "Sports - #{@round.percent_correct_by_category(:Sports)}% correct"
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct"

end


start

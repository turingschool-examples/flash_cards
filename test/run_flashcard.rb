require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

@card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card2 = Card.new("The beaver is the national emblem of what country?", "Canada", :Geography)
@card3 = Card.new("In what year was the last NBA expansion?", "2004", :Sports)
@card4 = Card.new("What sport did an astronaut play on the moon in 1971?", "Golf", :Sports)

@cards =[@card1, @card2, @card3, @card4]

@deck = Deck.new(@cards)

@round = Round.new(@deck)

def start_game
  puts "----------------------------------------------------"
  puts "Welcome! You're playing with #{@deck.count} card(s)!"

  while @deck.count > 0
    puts "----------------------------------------------------"
    puts "This is card #{@round.turns.count + 1} of #{@deck.count + @round.turns.count}!"
    puts "Question: #{@round.current_card.question}"
    print "> "
    user_answer = gets.chomp.capitalize
    @round.take_turn(user_answer)
    puts @round.turns.last.feedback
  end

  puts "    *** Game Over ***"
  puts "You had #{@round.number_correct} correct guesses on #{@round.turns.count} cards for a total score of #{@round.percent_correct}."
  puts "Percentages by category: "
  puts "Geography - #{@round.percent_correct_by_category(:Geography)}"
  puts "Sports - #{@round.percent_correct_by_category(:Sports)}"
end

start_game()

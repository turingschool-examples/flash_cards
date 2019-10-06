require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

def start

  cards = CardGenerator.new("cards.txt").cards
  deck = Deck.new(cards)

  original_deck = deck.count

  round = Round.new(deck)

  card_number = 0

  puts ""
  puts "****** Welcome to Flashcards! ******"
  puts ""
  puts "You're playing with #{original_deck} cards."
  puts "-" * 50

  until deck.count == 0

    card_number += 1

    puts "This is card number #{card_number} out of #{original_deck}."
    puts "Question: #{round.current_card.question}"
    print ">"
    player_guess = gets.chomp.downcase
    puts round.take_turn(player_guess).feedback
    puts "-" * 50

  end

  puts "****** Game over! ******"
  puts "-" * 50
  puts "Here is your scorecard:"
  puts ""
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
  puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff")}% correct"
  puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")}% correct"
  puts "-" * 50

end

start

puts "****** Do you want to try one more time? Enter Y or N. ******"
print ">"
user_answer = gets.chomp.upcase
  if user_answer == "Y"
    start
  elsif user_answer == "N"
    puts "****** Thanks for playing! ****** "
  end

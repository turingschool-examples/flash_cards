require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  card_1 = Card.new("Who is Sid's favorite Game of Thrones character?", "Jon Snow", :TV_Shows)
  card_2 = Card.new("What is Sid's favorite winter activity", "skiing", :Sports)
  card_3 = Card.new("Who is the best Avenger of all time?", "Thor", :Movies)
  card_4 = Card.new("What is Sid's favorite dessert?", "bread pudding", :Food)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.cards.length} cards."
  puts "--------------------------------------------------"
  # puts "This is card number #{start.deck.cards.first} out of #{start.deck.cards.count}"
  puts "This is card number #{deck.cards.index(card_1) + 1} out of #{deck.count}"
  # require 'pry'; binding.pry
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp
  # if guess == round.take_turn(guess).card.answer
  puts round.take_turn(guess).feedback

  gets

  puts "This is card number #{deck.cards.index(card_2) + 2} out of #{deck.count}"
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp
  puts round.take_turn(guess).feedback

  gets

  puts "This is card number #{deck.cards.index(card_3) + 3} out of #{deck.count}"
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp
  puts round.take_turn(guess).feedback

  gets

  puts "This is card number #{deck.cards.index(card_4) + 4} out of #{deck.count}"
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp
  puts round.take_turn(guess).feedback

  gets

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
  puts "#{card_1.category} - #{round.percent_correct_by_category(:TV_Shows).to_i}% correct"
  puts "#{card_2.category} - #{round.percent_correct_by_category(:Sports).to_i}% correct"
  puts "#{card_3.category} - #{round.percent_correct_by_category(:Movies).to_i}% correct"
  puts "#{card_4.category} - #{round.percent_correct_by_category(:Food).to_i}% correct"
end

start

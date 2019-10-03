require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

def start
  card_1 = Card.new('On what side of the road do you drive in South Africa?', 'left', :Transport)
  card_2 = Card.new('How many capital cities does South Africa have?', '3', :Geography)
  card_3 = Card.new('In what year did South Africa host the Soccer World Cup?', '2010', :Sport)
  card_4 = Card.new('What is the most common language spoken as a first language in South Africa?', 'zulu', :Demography)

  cards = [card_1, card_2, card_3, card_4]

  deck = Deck.new(cards)

  round = Round.new(deck)

  number_rounds = round.deck.cards.count
  nr_rounds_str = number_rounds.to_s

  puts ""
  puts "Welcome! You're playing with " + nr_rounds_str + " cards."
  puts "-------------------------------------------------"
  puts ""

  number_rounds.times do |round_number|
    puts "This is card number " + (round_number + 1).to_s + " out of " + nr_rounds_str + "."
    puts "Question: " + round.current_card.question
    user_answer = gets.chomp
    user_answer.downcase!
    round.take_turn(user_answer)
    puts round.feedback
    puts ""
  end

  puts '****** Game over! ******'
  puts 'You had ' + round.number_correct.to_s + ' correct guesses out of ' + nr_rounds_str + ' for a total score of ' + round.percent_correct.to_s + '.'

  round.percent_correct_by_category.each do |key, value|
    puts "#{key} - #{value} correct"
  end

  puts ""

end

start

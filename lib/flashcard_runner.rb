require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

def start

  new_csv = CardGenerator.new('./csv/csv_us_states_capitals.csv')
  new_csv.extract_csv

  deck = Deck.new(new_csv.cards)

  # ask user how many cards they would like to practice
  puts ""
  print "Please enter the number of cards you would like to practice: "
  nr_cards = gets.chomp.to_i

  # ask user if they would like the round to be shuffled
  puts ""
  print "Please state whether you would like the cards to be shuffled (y/n): "
  shuffle_answer = gets.chomp.downcase
  if shuffle_answer == 'y'
    shuffle = true
  elsif shuffle_answer == 'n'
    shuffle = false
  end

  round = Round.new(deck, shuffle)

  nr_cards_str = nr_cards.to_s



  puts ""
  puts "Welcome! You're playing with " + nr_cards_str + " cards."
  puts "-------------------------------------------------"
  puts ""

  nr_cards.times do |round_number|
    puts "This is card number " + (round_number + 1).to_s + " out of " + nr_cards_str + "."
    puts "Question: " + round.current_card.question
    user_answer = gets.chomp
    user_answer.downcase!
    round.take_turn(user_answer)
    puts round.feedback
    puts ""
  end

  puts '****** Game over! ******'
  puts 'You had ' + round.number_correct.to_s + ' correct guesses out of ' + nr_cards_str + ' for a total score of ' + round.percent_correct.to_s + '.'

  round.percent_correct_by_category.each do |key, value|
    puts "#{key} - #{value} correct"
  end

  puts ""

end

start



# card_1 = Card.new('On what side of the road do you drive in South Africa?', 'left', :Transport)
# card_2 = Card.new('How many capital cities does South Africa have?', '3', :Geography)
# card_3 = Card.new('In what year did South Africa host the Soccer World Cup?', '2010', :Sport)
# card_4 = Card.new('What is the most common language spoken as a first language in South Africa?', 'zulu', :Demography)

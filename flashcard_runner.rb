require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start
  card_generator = CardGenerator.new('card.txt')
  list_cards = card_generator.cards

  puts "Welcome to the Math Flash Card Game!"
  puts "Please enter your name to start"
  
  user_name = gets.chomp
  
  puts "Hello #{user_name}"
  puts "How many cards would you like?"
  puts "0 for random (Will Be Between 1-10)"
  puts "Negative numbers for list file"
  
  num_cards = gets.chomp.to_i
  if num_cards == 0
    num_cards = random_number(10)
  elsif num_cards < 0
    deck = list_cards
    num_cards = deck.count
  else
    deck = Deck.new(num_cards.times.map {create_card})
  end
  
  puts "You'll be playing with #{num_cards} cards"
  puts "****************************************"
  
  round = Round.new(deck)
  deck.cards.each_with_index do |turn, idx|
    puts "This is card ##{idx + 1} out of #{deck.count}"
    puts "Question: What is #{round.current_card.question}?"
    this_turn = round.take_turn(user_answer = gets.chomp.to_i)
    puts "#{this_turn.feedback}"
  end

  puts "****** Game over! ******"
  puts %W[You had #{round.number_correct} 
       correct guesses out of #{deck.count} 
       for a total score of %
       #{round.percent_correct}].join(' ')
  round.categories.each do |category|
    puts %W[#{category} - 
         #{round.percent_correct_by_category(category)}% 
         correct"].join(' ')
  end
end

def create_card
  type_idx = random_number(3) - 1
  problem_type = {
    operators: ["+", "-", "*"],
    types:     [:Add, :Subtract, :Multiply]
  }
  curr_ops_type = problem_type[:operators][type_idx]
  curr_cat_type = problem_type[:types][type_idx]
  numbers = [random_number(20), random_number(20)]
  question = "#{numbers[0]} #{curr_ops_type} #{numbers[1]}"
  answer = eval question
  Card.new(question, answer, curr_cat_type)
end

def random_number(bound)
  (1..bound).to_a.sample
end

start

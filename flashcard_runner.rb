require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  puts "Welcome to the Math Flash Card Game!"
  puts "Please enter your name to start"
  
  user_name = gets.chomp
  
  puts "Hello #{user_name}"
  puts "How many cards would you like?"
  puts "0 for random (Between 1-10)"
  
  num_cards = gets.chomp.to_i
  if num_cards <= 0
    num_cards = random_number(10)
  end
  
  puts "You'll be playing with #{num_cards} cards"
  puts "****************************************"
  
  deck = Deck.new(num_cards.times.map {create_card})
  round = Round.new(deck)
  deck.cards.each_with_index do |turn, idx|
    puts "This is card ##{idx + 1} out of #{deck.count}"
    puts "Question: What is #{round.current_card.question}?"
    round.take_turn(user_answer = gets.chomp.to_i)
  end

end

def create_card
  type_idx = random_number(3)
  problem_type = {
    operators: ["+", "-", "/", "*"],
    types:     [:add, :sub, :mult, :div]
  }
  curr_ops_type = problem_type[:operators][type_idx]
  curr_cat_type = problem_type[:types][type_idx]
  numbers = [random_number(20), random_number(20)]
  question = "#{numbers[0]} #{curr_ops_type} #{numbers[1]}"
  answer = eval question
  Card.new(question, answer.round(2), curr_cat_type)
end

def random_number(bound)
  (1..bound).to_a.sample.to_f
end

start

require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

# Create a deck for the trivia round.
card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due North?', 'North north west', :STEM)
card_4 = Card.new("Where did the character Indiana Jones get his name 'Indiana' from?", 'The dog', :Movie)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

# Primary game method to start game,and call other helper methods to output to the user.
def start(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts "-------------------------------------------------"
  
  # Main game loop which displays question, takes guess and returns feedback.
  round.deck.count.times do
    print_card(round)
    guess_response(round)
  end

  print_end_screen(round)
end

# Print the current card information to the user.
def print_card(round)
  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}."
  puts "Question: #{round.current_card.question}"
end

# Collect user input and return guess feedback.
def guess_response(round)
  user_input = gets.chomp
  puts round.take_turn(user_input).feedback
end

# Print the final end game stats for the user.
def print_end_screen(round)
  puts '****** Game over! ******'
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct.truncate}%."
  
  # Creates a list of all categories without any duplicates.
  category_list = round.deck.cards.map do |card|
    card.category
  end.uniq

  # Output percentage correct per category to the user.
  category_list.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category).truncate}% correct"
  end
end

# Start the game when the Ruby file is run.
start(round)
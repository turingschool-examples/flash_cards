require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/turn"
require "./lib/card_generator"
require "pry"

filename = "./cards.txt"
card_generator = CardGenerator.new(filename)
fact_cards = card_generator.cards

play_deck = Deck.new(fact_cards) # initialize the deck

initialize_round = Round.new(play_deck) # initialize the current round

def display_welcome_message(round) # i dont know why im splitting these, but i think it's a good practice for making it more legible.
  puts "Welcome! You're playing with #{round.deck.cards.count} cards." # really no point unless i was using "clear console" commands and reprinting this message
  puts "-------------------------------------------------"
end

def get_user_input # Get user input split into a different def to make me accomplish the "DRY" principle
  print "Your answer: "
  gets.chomp
end

def play_game(round)
  while round.turns.count < round.deck.cards.count # while the number of turns is less than the number of cards in the deck
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}." # print the current card number to console
    puts "Question: #{round.deck.cards[round.turns.count].question}" # print the current card question to console (this was a pain in the butt to figure out cause i forgot about the whole ummm card array thing)
    
    user_answer = get_user_input # get the user input will only use this method once butttt hey it is clean!

    turn = round.take_turn(user_answer) # take the turn with the user input
    puts turn.feedback # print the feedback to the console (correct or incorrect)
  end
end

def display_game_over_message(round)
  puts "****** Game over! ******" # print game over message to console
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."
end

def calculate_category_performance(round, category) # just a large calculation that i seperated from the display categort performance method
  total_in_category = round.deck.cards.count { |card| card.category == category } # total number of cards in the category
  correct_in_category = round.turns.count { |turn| turn.card.category == category && turn.correct? } # number of correct answers in the category
  (correct_in_category.to_f / total_in_category * 100).round(2) # calculate the percentage of correct answers in the category
end

def display_category_performance(round) # display the category performance will use this method above ^^^
  categories = round.deck.cards.map(&:category).uniq # get the unique categories from the cards
  categories.each do |category| # for each category
    percent_correct_in_category = calculate_category_performance(round, category) # calculate the percentage of correct answers in the category
    puts "#{category} - #{percent_correct_in_category}% correct" # print the category and the percentage of correct answers
  end
end

def start(round) # im not going to bother commenting on these
  display_welcome_message(round)
  play_game(round)
  display_game_over_message(round)
  display_category_performance(round)
end

start(initialize_round) # Start the round
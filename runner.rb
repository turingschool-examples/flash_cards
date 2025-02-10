require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/turn"
require "./lib/card_generator"
require "./lib/hint"
require "pry"

filename = "./cards.txt"
card_generator = CardGenerator.new(filename)
fact_cards = card_generator.cards


nums = [100, 200, 300, 400]

# print all the numbers in the array
nums.each do |num|
  puts num
end

play_deck = Deck.new(fact_cards) # initialize the deck

initialize_round = Round.new(play_deck) # initialize the current round

def display_welcome_message(round) # i dont know why im splitting these, but i think it's a good practice for making it more legible.
  puts "Welcome! You're playing with #{round.deck.cards.count} cards." # really no point unless i was using "clear console" commands and reprinting this message
  puts "You have one hint, use it wisely! (type 'hint' to use it)"
  puts "-------------------------------------------------"
end

def get_user_input # Get user input split into a different def to make me accomplish the "DRY" principle
  print "Your answer: "
  gets.chomp
end

def play_game(round)
  hint_used = false # set the hint used to false at firsts
  while round.turns.count < round.deck.cards.count # while the number of turns is less than the number of cards in the deck
    puts "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}." # print the current card number to console
    puts "Question: #{round.deck.cards[round.turns.count].question}" # print the current card question to console (this was a pain in the butt to figure out cause i forgot about the whole ummm card array thing)

   user_answer = nil
    if !hint_used && round.deck.cards[round.turns.count].hint
      print "Your answer: "
      user_input = gets.chomp.downcase
      if user_input == 'hint'
        puts "Hint: #{round.deck.cards[round.turns.count].hint}"
        hint_used = true
        user_answer = get_user_input
      else
        user_answer = user_input # accidentally was using "get_user_input" here causing many issues. Fixed it!
      end
    else
      user_answer = get_user_input # just a sanity check
    end


    turn = round.take_turn(user_answer) # take the turn with the user input
    puts "----------------" # print a line to the console
    puts turn.feedback # print the feedback to the console (correct or incorrect)
    puts "----------------" # print a line to the console
    system("sleep 1.7") # sleep for 1.7 seconds
    system("clear") || system("cls") # clear the console

  end
end

def display_game_over_message(round)
  puts "****** Game over! ******" # print game over message to console
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."
end

def display_category_performance(round)
  categories = round.deck.cards.map(&:category).uniq # get the unique categories from the cards
  categories.each do |category|
    percent_correct_in_category = round.percent_correct_by_category(category) # calculate the percentage of correct answers in the category
    puts "#{category} - #{percent_correct_in_category}% correct" # print the category and the percentage of correct answers
  end
  puts "****** Game over! ******" # print game over message to console again to encapsulate the category performance stats
end

def add_fact_card(file_name) # add a fact card to the file 
  print "\nWould you like to add your own fact card? (y/n): "
  response = gets.chomp.downcase # will ensure that the users input it lowercase (or could just add || response == "Y")
  if response == 'y' || response == 'yes'
    print "Enter the question: " # get the question
    question = gets.chomp
    print "Enter the answer: " # get the answer
    answer = gets.chomp
    print "Enter the category: " # get the category
    category = gets.chomp
    print "Enter the hint: " # get the hint
    hint = gets.chomp

    File.open(file_name, 'a') do |file|
      file.puts("#{question},#{answer},#{category},#{hint}") # write the new card to the file
    end
    puts "Your fact card has been added!"
    system("sleep 2") # sleep for 2 seconds
    # this next part will only really work based on users hardware but i dont want to deal with windows right now
    system("clear") || system("cls") # clear the console (I am pretty sure cls is clear screen for windows I am not going to test though)
    # cls worked in c++ for windows sooooo here is to hoping!
  else
    puts "Maybe next time!"
    system("sleep 2")
    system("clear") || system("cls")
  end
end

def prompt_to_play_again(filename)
  print "Would you like to play again? (y/n): "
  replay = gets.chomp.downcase
  if replay == 'y' || replay == 'yes'
    card_generator = CardGenerator.new(filename)
    fact_cards = card_generator.cards
    play_deck = Deck.new(fact_cards)
    initialize_round = Round.new(play_deck)
    start(initialize_round, filename)
  else
    puts "Thank you for playing! Goodbye!"
  end
end

def start(round, file_name) # im not going to bother commenting on these
  display_welcome_message(round)
  play_game(round)
  display_game_over_message(round)
  display_category_performance(round)
  add_fact_card(file_name)
  prompt_to_play_again(file_name)
end

start(initialize_round, filename) # Start the round
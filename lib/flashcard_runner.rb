require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Start the round using a method called 'start'
def start(round)

  # call the 'greeting' method to greet the user
  # parameter - takes in an instance of Round in order to access contents of Round
  greeting(round)

  # run through the loop as many times as there are number of cards in the deck
  # grab the user's input(guess) and determine if correct/incorrect
  round.deck.count.times do
    puts "This is card number #{round.count + 1} out of #{round.deck.count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp

    # take the first turn (get the first flashcard)
    turn = Turn.new(guess, round.current_card)
    # display back to the user their feedback after each guess
    is_guess_correct = turn.feedback
    puts is_guess_correct

    # take another turn (move to the next flashcard)
    round.take_turn(guess)
  end

  # when the loop is completed, call the 'end_of_game' method to end the game
  end_of_game(round)
end


# 'greeting' method that displays to the user a welcome and the number of cards to expect
def greeting(round)
  puts "Welcome! You're playing with #{round.deck.count} cards."
end

# 'end_of_game' method that displays to the user the number of correct answers,
# the percent correct, and the percent correct by category
def end_of_game(round)
  puts "****** GAME OVER ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  puts "Turing Staff - #{round.percent_correct_by_category('Turing Staff')}% correct"
  puts "Pop Culture - #{round.percent_correct_by_category('Pop Culture')}% correct"
end

# Create some cards
card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Cat", 'Turing Staff')
card_3 = Card.new("What is Mike's middle name?", "Nobody knows", 'Turing Staff')
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", 'Pop Culture')

# Put those cards into a Deck
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

# Creat a new Round using the Deck created above
round = Round.new(deck)

# call the 'start' method in order to run the game 
start(round)

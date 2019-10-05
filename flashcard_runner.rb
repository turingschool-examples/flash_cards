#runner.rb

require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'

def start
  card_1 = Card.new("What is 2 + 3?", "5", :Math)
  card_2 = Card.new("What is 10 * 2?", "20", :Math)
  card_3 = Card.new("What is 15 / 5?", "3", :Math)
  card_4 = Card.new("What is 3 + 2 + 3?","8",:Math)
  card_5 = Card.new("What is the capital of Illinois?","Springfield",:Geography)
  card_6 = Card.new("What is the capital of Texas?","Austin",:Geography)
  card_7 = Card.new("What is the capital of Colorado?","Denver",:Geography)
  card_8 = Card.new("What is the capital of Michigan?","Lansing",:Geography)
  card_9 = Card.new("What is the price of a MacBook Pro?","1200",:PIR)
  card_10 = Card.new("What is the price of a iPhone?","1000",:PIR)

  cards = [card_1, card_2, card_3,
            card_4, card_5, card_6,
            card_7, card_8, card_9, card_10]
  cards.shuffle! #randomize card order

  category_options = [] # checks deck for different categories
  cards.each do |x|     # and stores in category_options
    if category_options.include?(x.category)
    else
      category_options << x.category
    end
  end

  deck = Deck.new(cards)
  round = Round.new(deck)

  deck_count = cards.count #set fixed variable for total amount of cards in deck
  current_round = 1

  p "Welcome! You're playing with #{deck_count} cards."
  # game starts with round 1, total rounds = deck_count
  deck_count.times do
    p "This is card number #{current_round} of #{deck_count}"
    p "Question: " + round.current_card.question
    guess = gets.chomp

    new_turn = round.take_turn(guess) #completes turn 1 w. a guess
    p new_turn.feedback #correct/incorrect
    current_round += 1 #keeps track of current round

  end

  p "***** GAME OVER *****"
  p "You had #{round.number_correct} correct guesses out of #{deck_count} or a total score of #{round.percent_correct})"

  category_options.each do |x|
    p "#{x[0..-1]} - #{round.percent_correct_by_category(x)}% correct"
    # removes the ':' in front of the category
  end
end

start # starts the game
# would like to add the ability to reset stats when the game starts

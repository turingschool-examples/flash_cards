#runner.rb
require_relative 'lib/card'
require_relative 'lib/turn'
require_relative 'lib/deck'
require_relative 'lib/round'
require_relative 'lib/card_generator'

def start
  filename = 'cards.txt'
  cards = CardGenerator.new(filename).cards
  cards.shuffle! #randomize card order

 # checks deck for different categories
 # and stores in category_options
  category_options = []
  cards.each do |x|    
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

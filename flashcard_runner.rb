require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

# main function definition
def start(round_var)
  # declare preliminary variables
  deck_var = round_var.deck
  cards_var = deck_var.cards

  # opening messages
  p "Welcome! You're playing with #{cards_var.length} cards."
  p "--------------------------------------------------"

  # main quiz gameplay loop
  round_var.deck.cards.each { |card|
    p "This is card #{(round_var.index + 1)} out of #{cards_var.length}"
    p "Question: #{round_var.current_card.question}"
    input = gets.chomp
    new_turn = round_var.take_turn(input)
    new_turn.feedback
  }

  # closing messages
  p "*** Game over! ***"
  p "You had #{round_var.number_correct} correct guesses out of #{cards_var.length} for a total score of #{round_var.percent_correct}%."
  
  # sort cards by category
  categories = []
  cards_var.each {|card|
    if !categories.include?(card.category)
      categories << card.category 
    end
  }

  # display percent correct by category
  categories.each {|category|
    p "#{category} - #{round_var.percent_correct_by_category(category)}% correct"
  }
end

# card_generator text file integration
filepath = "cards.txt"
gen = Card_Generator.new(filepath)
deck = Deck.new(gen.cards)
round = Round.new(deck)

# main function call for CLI
start(round)
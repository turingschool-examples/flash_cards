require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

def start(round_var)
  deck_var = round_var.deck
  cards_var = deck_var.cards
  turns_var = round_var.turns

  p "Welcome! You're playing with #{cards_var.length} cards."
  p "--------------------------------------------------"

  round_var.deck.cards.each { |card|
    p "This is card #{(round_var.index + 1)} out of #{cards_var.length}"
    p "Question: #{round_var.current_card.question}"
    input = gets.chomp
    new_turn = round_var.take_turn(input)
    new_turn.feedback
  }

  p "*** Game over! ***"
  p "You had #{round_var.number_correct} correct guesses out of #{cards_var.length} for a total score of #{round_var.percent_correct}%."
  
  categories = []
  cards_var.each {|card|
    if !categories.include?(card.category)
      categories << card.category 
    end
  }

  categories.each {|category|
    p "#{category} - #{round_var.percent_correct_by_category(category)}% correct"
  }

end

filepath = "cards.txt"
gen = Card_Generator.new(filepath)
deck = Deck.new(gen.cards)
round = Round.new(deck)

start(round)
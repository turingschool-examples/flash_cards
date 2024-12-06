require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

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

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5 degrees clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

start(round)
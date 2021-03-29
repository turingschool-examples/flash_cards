require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Spain?", "Madrid", :Geography)
card_2 = Card.new("What actress has won the most Oscars?", "Katharine Hepburn", :Cinema)
card_3 = Card.new("What is the colour of a Welsh poppy?", "Yellow", :Gardening)
card_4 = Card.new("What is another name for a mountain ash tree?", "Rowan", :Gardening)
card_5 = Card.new("What country is Prague in?", "Czech Republic", :Geography)
card_6 = Card.new("Who directed the Lord of the Rings trilogy?", "Peter Jackson", :Cinema)
cards  = [card_1, card_2, card_3, card_4, card_5, card_6]
# cards = CardGenerator.new(filename).cards
deck   = Deck.new(cards)
round  = Round.new(deck)

def start(cards, deck, round)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"

  while round.turns.length < deck.count 
    turn_number = round.turns.length + 1
  
    puts "This is card number #{turn_number} out of #{deck.count} cards."
    puts "Question: #{round.current_card.question}"
    print '> '
    user_input = gets.chomp
    new_turn = round.take_turn(user_input)
    puts new_turn.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
  #I know this is after the time limit but I just noticed I didn't update this line...
  round.category_scores
end

start(cards,deck,round)



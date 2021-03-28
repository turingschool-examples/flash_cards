require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start
  card_1 = Card.new("What is the capital of Spain?", "Madrid", :Geography)
  card_2 = Card.new("What actress has won the most Oscars?", "Katharine Hepburn", :Cinema)
  card_3 = Card.new("What is the colour of a Welsh poppy?", "Yellow", :Gardening)
  card_4 = Card.new("What is another name for a mountain ash tree?", "Rowan", :Gardening)
  card_5 = Card.new("What country is Prague in?", "Czech Republic", :Geography)
  card_6 = Card.new("Who directed the Lord of the Rings trilogy?", "Peter Jackson", :Cinema)
  cards  = [card_1, card_2, card_3, card_4, card_5, card_6]
  deck   = Deck.new(cards)
  round  = Round.new(deck)

  greeting    = "Welcome! You're playing with #{deck.count} cards."
  line_break = "-------------------------------------------------"

  puts greeting
  puts line_break

  while round.turns.length < deck.count 
    turn_number = round.turns.length + 1
    card_number = "This is card number #{turn_number} out of #{deck.count} cards."
    question = "Question: #{round.current_card.question}"
  
    puts card_number
    puts question
    print '> '
    user_input = gets.chomp
    new_turn = round.take_turn(user_input)
    puts new_turn.feedback
  end
end

start


# def start
#   # starts Round

#   #Cards - Deck - Round
#   card_1 = Card.new("What is the capital of Spain?", "Madrid", :Geography)
#   card_2 = Card.new("What actress has won the most Oscards?", "Katharine Hepburn", :Cinema)
#   card_3 = Card.new("What is the colour of a Welsh poppy?", "Yellow", :Gardening)
#   card_4 = Card.new("What is another name for a mountain ash tree?", "Rowan", :Gardening)
#   card_5 = Card.new("What country is Prague in?", "Czech Republic", :Geography)
#   card_6 = Card.new("Who directed the Lord of the Rings trilogy?", "Peter Jackson", :Cinema)
#   cards  = [card_1, card_2, card_3, card_4, card_5, card_6]
#   deck   = Deck.new(cards)
#   round  = Round.new(deck)
#   turn_number = round.turns.length + 1

#   #CLI output 
#   greeting    = "Welcome! You're playing with #{deck.count} cards."
#   card_number = "This is card number #{turn_number} out of #{deck.count} cards."
#   #should include the number of the card - add counter on card?
#   #should include the number of cards in the deck array 

#   line_break = "-------------------------------------------------"

#   #turn >> card >> question
#   #deck >> cards >> card >> question
#   #round >> current_card >> question
#   #check out the methods >> current_card.question
#   question = "Question: #{round.current_card.question}"
  
#   #should return the question on the current card. 
#   #new method in the round
#   #takes answer 
#   puts greeting
#   puts line_break
#   puts card_number
#   puts question
#   puts round.current_card
#   print '> '
#   user_input = gets.chomp

#   new_turn = round.take_turn(user_input)
#   #round >> current_card >> correct?
#   puts new_turn.feedback

#   #round 2
#   turn_number = round.turns.length + 1
#   puts round.current_card
#   puts card_number
#   puts question
# end

# start

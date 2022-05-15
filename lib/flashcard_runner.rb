require './card'
require './deck'
require './turn'
require './round'
require 'rspec' #may not need since we're not testing this file but just in case
require 'pry' #in case I want to run pry on this file


# round.deck
# round.turns
# round.current_card
# new_turn = round.take_turn("20")
# round.take_turn("The Nile")

def start
  card_1 = Card.new("What is 10 + 10?", "20", :STEM)
  card_2 = Card.new("What is the longest river in the world?", "The Nile", :Geography)
  card_3 = Card.new("What is the highest mountain in the world?", "Mount Everest", :Geography)
  card_4 = Card.new("How many planets in our solar system?", "8", :STEM)
  deck = Deck.new([card_1, card_2, card_3, card_4])
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards" #should return 4 cards, placed outisde of  while loop so it doesn't continuously repeat

  i = 0
  while i < deck.count
    i += 1 #iterating at the top so i can reflect card number
    puts "This is card number #{i} out of #{deck.count}"
    puts "Question: #{round.current_card.question}" #iterates through card array not sure if to address deck or round? deck.cards[i].question
    given_answer = gets.chomp
    curr_turn = round.take_turn(given_answer) # inititates curr turn with given answer
    # current_turn = Turn.new(given_answer, deck.cards[i]) #retrieving answer and then making it a turn
    puts round.turns.last.feedback #returns if correct or incorrect
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}."
  puts "STEM - #{round.percent_correct_by_category(:STEM)}"
  puts "Geography - #{round.percent_correct_by_category(:Geography)}"
  # puts "Pop Culture - #{round.percent_correct_by_category(:Pop_Culture)}"
end

start

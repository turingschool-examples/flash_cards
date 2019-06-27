require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

@card_1 = Card.new("What type of meat is chashu?", "pork", :Food)
@card_2 = Card.new("Are heirloom tomatoes determinate or indeterminate?", "indeterminate", :Garden)
@card_3 = Card.new("What type of plant uses bacterial nodes to fix nitrogen in the soil?", "legume", :Garden)
@card_4 = Card.new("What type of bones are used to make ramen broth?", "neck bones", :Food)
@card_5 = Card.new("What is the name for the cooking method that involves cooking at a consistent temperture in a water bath", "sous vide", :Food)

@deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5])
@round = Round.new(@deck)

def start
  puts "Welcome! You're playing with 4 cards."
  puts "-----------------------------------"
  puts "-----"
  #should i get the card number in a different way
  puts "This is card number 1 out of #{@deck.count + @round.turns.count}"
  puts "Question: #{@round.current_card.question}"
  #binding.pry

  answer = gets.chomp
  @round.take_turn(answer)
  puts @round.turns.last.feedback
    #should i get the card number in a different way
  puts "This is card number 2 out of #{@deck.count + @round.turns.count}"
end

start

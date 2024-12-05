# flashcard_runner.rb - run a sample game session / round

#Required classes and additional facilities
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

require 'pry'

#Create 4 cards and build a deck
card_1 = Card.new("What is 5 + 5?", "10", :STEM)        #NOTE: need .to_s for this kind of guess...add this later!
card_2 = Card.new("What is Rachel's favorite animal?", "Meerkat", :Turing_staff)  #Why is "\'" not needed?
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

deck = Deck.new([card_1, card_2, card_3, card_4])       #Alternate: deck = Deck.new([]), then add cards with my other method

#Initialize and start/introduce the round
round = Round.new(deck)
round.start

#Run the round
#NOTE: for now, this lives here, but could also live in another method / class...

#At a crossroads:
#Either can collect guess here, then pass to round.take_turn(); or build into take_turn() logic istelf.
#The former is perhaps quicker and doesn't mess with existing structure (i.e. fewer surprise changes), though the latter is perhaps better organized.
#For now, I'll go with the former, but may change it up later.

#First, we need a way to get the user's input:
def get_user_guess()
    #Get input via CLI and clean it up (could expand on this later)
    user_input = gets
    return user_input.to_s.strip
end

#Iterate through the full deck to complete the round
#I'm using a while loop for this approach
while round.current_card != nil                 #Whew, it works!
    #Print current card's question
    puts "This is card number #{round.current_card_index + 1} out of #{round.deck.count}."
    puts "Question: " + round.current_card.question
    #Take the turn by getting the user's guess and check against the card, etc.
    round.take_turn(get_user_guess())
end

#Wrap it all up
round.finish()


binding.pry

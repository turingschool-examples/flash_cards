require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
  and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5°
  clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
  #require "pry"; binding.pry
  counter = 1
  puts "Welcome! You're playing with #{round.deck.count} cards "
  puts "-------------------------------------------------"

  # show question
  # collect guess
  # create turn file - store guess, card


  while(counter <= round.deck.count)
    puts "This is card number #{counter} out of #{round.deck.count}."
    puts round.deck.cards[0].question
    guess = gets.chomp #gets
    #require "pry"; binding.pry

    turn = round.take_turn(guess)
    #require "pry"; binding.pry
    puts turn.feedback

    counter += 1
  end

  puts "****** Game over! ******"
  # require "pry"; binding.pry
  puts "You had #{round.number_correct} correct guesses out of #{round.deck.count}
   for a total score of #{round.percent_correct}%."

  puts "Geography - #{round.percent_correct_by_category(:Geography)} % correct"
  puts "Stem - #{round.percent_correct_by_category(:STEM)} % correct"


end

start(round)

require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card_1 = Card.new("What was the capital of Assyria in 700BC?", "Ninevah", :AncientGeography)
card_2 = Card.new("Nic Cage made his film debut in what movie?", "Fast Times at Ridgemont High", :Film)
card_3 = Card.new("What TV show has won the most Emmy's of all time?", "SNL", :TV)

cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

                                  # Simple example of gets syntax
                                    # puts "What is your name?"
                                    # name = gets
                                    # puts "Hi #{name}"
                                    # create a new method called `start`

def start(cards, deck, round)
  card_number = 1

  puts "Welcome! You're playing with #{deck.count} cards"
  puts "-------------------------------------------------"
  # Insert each or other enumerator to iterate each of the cards in deck
  puts "This is card number #{card_number} out of #{deck.count}"
  card_number += 1

  puts "Question: #{deck.cards[0].question}"
  player_guess = gets.chomp
  new_turn = round.take_turn(player_guess)
  puts "#{new_turn.feedback}"

  # Once all cards have a <guess> end the enumerator

  # puts "****** Game over! ******"
  # puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct}"
  # iterate through each of the categories to print below
  # puts "#{Category} - #{round.percent_correct_by_category(Category)} correct"
  # repeat this for each category
end

start(cards, deck, round)

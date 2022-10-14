require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
#Create some cards
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

  # Greet the player when started
def start(cards, deck, round)
  card_number = 1

  puts "Welcome! You're playing with #{deck.count} cards"
  puts "-------------------------------------------------"
  puts "This is card number #{card_number} out of #{deck.count}"
  card_number += 1

  puts "Question: #{deck.cards[0].question}"
  puts deck.cards[0].answer

  guess = gets
  new_turn = round.take_turn("#{guess}")
  puts new_turn.correct?
  puts guess
  puts "#{new_turn.feedback}"

  # puts "This is card number <current_card#> out of <deck size>"
  # puts "Question <nth question>"

  # continue through each card in the Deck

  # Once all cards have a <guess>
  # puts "****** Game over! ******"
  # puts "You had <num_correct> correct guesses out of <deck size> for a total score of <percent correct>"
  # puts "<Category> - <percent_correct_by_category> correct"
  # repeat this for each category
end

start(cards, deck, round)

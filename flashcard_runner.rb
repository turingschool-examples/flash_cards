require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
  # display a welcome message, tell user which card they're on in the deck
  puts "Welcome! You're playing with #{round.deck.count} cards. \n --------- \n"

  # while there are cards in the deck,
    # give user the card number of total and
    # question from card
    # take user input
    # see if they got it right
    # tell them if it's right or wrong
  counter = 0
  cards_length = round.deck.count
  while counter < cards_length do
    counter += 1
    puts "This is card number #{round.turns_count + 1} of #{cards_length}."
    puts "Question: #{round.current_card.question}"
    user_answer = gets.chomp
    turn = round.take_turn(user_answer)
    puts turn.feedback
  end
end

#start the game!
start(round)

#when there are no more cards, surface the overall results
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns_count}, for a total score of #{round.percent_correct}%."

#iterate through category values from the deck, printing the percentage correct by category
categories = round.deck.categories_in_deck

categories.each do |item|
  puts "#{item} - #{round.percent_correct_by_category(item)}%"
end

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
  total_cards = round.deck.cards.count
  p "Welcome! You're playing with #{total_cards} cards."
  round.deck.cards.each_with_index do |card, index|
    card_position = index + 1
    p "This is card number #{card_position} out of #{total_cards}."

    p "Question: #{card.question} "
    guess = gets.chomp
    round.take_turn(guess)
    if index == 1
      binding.pry
    end
    p round.turns[index].feedback
    # binding.pry

  end


  # print out the first question
  # use get.chomp to take in a user response
  # use the user response if it was right or wrong
  # calculate the score

  # if deck.cards go to the next card

  # if current card is nil then game is done
end

def go_to_next_card
end

start(round)

require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What percent of the universe is dark matter?", "27", :STEM)
card_2 = Card.new("Which United States President was the only one to serve two non-consecutive terms?", "Grover Cleveland", :HISTORY)
card_3 = Card.new("Rounded to the nearest ten, approximately how many bones is a human born with?", "270", :HEALTH)
card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)
card_deck = [card_1, card_2, card_3, card_4, card_5]

deck = Deck.new(card_deck)
start_deck = Deck.new(card_deck)

round1 = Round.new(start_deck)

def start(round)
  puts "Welcome! You're playing with #{ round.deck.cards.count } cards."
  puts "---------------------------------------------------------------"
  puts "This is card number #{ round.current_card } out of #{ round.deck.cards.count }."
  puts "Question: #{ round.current_card.question }"
end

start(round1)

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
start_deck = Deck.new(card_deck)
round1 = Round.new(start_deck)

def start(round)
  puts "Welcome! You're playing with #{ round.deck.cards.length } cards."
  puts "---------------------------------------------------------------"
  # loop through the deck of cards to ask questions and take guesses
  round.deck.cards.length.times do
    puts "This is card number #{ round.turns.length + 1 } out of #{ round.turns.length + round.deck.cards.length } ."
    puts "Question: #{ round.current_card.question }"
    puts round.take_turn(gets.chomp).feedback
  end
  # time to end the round
  puts "****** Game over! ******"
  puts "You had #{ round.number_correct} correct guesses out of #{ round.deck.cards.length }
        for a total score of #{ round.percent_correct }%."
  round.turns.each do |turn|
    puts "#{ turn.card.category.capitalize } - #{ round.percent_correct_by_category(turn.card.category) }% correct"
  end
end

start(round1)

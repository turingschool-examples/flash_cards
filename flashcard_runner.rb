require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = './cards.txt'
card_deck = CardGenerator.new(filename).cards
start_deck = Deck.new(card_deck)
round1 = Round.new(start_deck)
#binding.pry
def start(round)
  puts "Welcome! You're playing with #{ round.deck.cards.length } cards."
  puts "---------------------------------------------------------------"
  # loop through the deck of cards to ask questions and take guesses
  round.deck.cards.length.times do
    puts "This is card number #{ round.turns.length + 1 } out of #{ round.turns.length + round.deck.cards.length }."
    puts "Question: #{ round.current_card.question }"
    puts round.take_turn(gets.chomp).feedback
  end
  # time to end the round
  puts "****** Game over! ******"
  puts "You had #{ round.number_correct} correct guesses out of #{ round.deck.cards.length }
        for a total score of #{ round.percent_correct }%."
  round.turns.each do |turn|
    puts "#{ turn.card.category } - #{ round.percent_correct_by_category(turn.card.category) }% correct"
  end
end

start(round1)

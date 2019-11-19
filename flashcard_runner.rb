require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


  @round = Round.new(
  @deck = Deck.new([
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
  @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
  @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM),
  @card_4 = Card.new("What is the name of the country that encompasses more than 250 islands?", "Indonesia", :Geography)
  ]))


def start
  puts "Welcome! You're playing with #{@round.deck.count} cards."
  puts "-------------------------------------------------"
  puts "This is card number 1 out of 4."
  puts "Question: #{@round.current_card.question}"
  puts "Your answer:"
  answer = gets.chomp
  puts @round.take_turn(answer) "#{}"
end

start

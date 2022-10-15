require 'pry'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


def start

  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  r_count = 1

  #def r_up(tick)
    #tick.count.times do |r_count|
    #r_count + 1
    #end
  #end

  puts "Welcome! You're playing with #{deck.count} cards.

  This card is number #{r_count} out of #{deck.count}.
  Question: #{round.current_card.question}"
  turn_1 = round.take_turn(gets.chomp)
  #turn_1 = Turn.new(gets.chomp,round.current_card)

  turn_1.guess == round.current_card.answer
  puts turn_1.feedback

end

start

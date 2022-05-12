require_relative 'card'
require_relative 'deck'
require_relative 'turn'
require_relative 'round'

card_1 = Card.new("Where did Go-Go music originate?", "Washington DC", :Culture)
card_2 = Card.new("Mass x Velocity equals what?", "Momentum", :STEM)
card_3 = Card.new("What is the name of Washington DC's soccer team?", "DC United", :Culture)
card_4 = Card.new("What is a Hokie?", "Nobody knows", :Culture)
card_5 = Card.new("What river divides Washington DC from Virginia?", "Potomac", :Geography)
cards = [card_1, card_2, card_3, card_4, card_5]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  count = 1
  puts "Welcome! You're playing with #{round.deck.count} cards."
  puts '-------------------------------------------------'
  while count < 6
    puts "\nThis is card number #{count}"
    puts round.deck.cards.first.question
    guess = gets.chomp
    puts round.take_turn(guess).feedback?
    count += 1
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} out of #{round.deck.count} for a total score of #{round.percent_correct}%"
  puts "STEM - #{round.number_correct_by_category(:STEM)}% correct"
  puts "Culture - #{round.number_correct_by_category(:Culture)}% correct"
  puts "Geography - #{round.number_correct_by_category(:Geography)}% correct"
end

start(round)

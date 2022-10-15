require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

def start

  card_1 = Card.new("What is 5 + 5?", "10", :stem)
  card_2 = Card.new("What is Rachel's favorite animal?", "Rat", :turing_staff)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :turing_staff)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :pop_culture)

  deck = Deck.new([card_1, card_2, card_3, card_4])

  round = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards"

# puts "--------------------------------------"

deck.count.times do


puts "--------------------------------------"

puts "This is card number #{round.turns.length + 1} out of #{deck.count}."

puts "Question: #{round.current_card.question}"

turn_1 = round.take_turn(gets.chomp)

puts "#{turn_1.feedback}"

  if round.turns.length == deck.count
    puts "******Game Over!******"

    puts "You had #{round.number_correct} out of #{deck.count} for a total of #{round.percent_correct}%"

    puts "STEM - #{round.percent_correct_by_category(:stem)}% correct"

    puts "Turing Staff - #{round.percent_correct_by_category(:turing_staff)}% correct"

    puts "Pop Culture - #{round.percent_correct_by_category(:pop_culture)}% correct"

  end

  end

end

start

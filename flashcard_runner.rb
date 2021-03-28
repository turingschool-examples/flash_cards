require './lib/card'
require './lib/turn'
require './lib/deck'
require'./lib/round'


class Start

  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "wallaby", :Turing)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round_1 = Round.new(deck)

  puts "Welcome! You're playing with #{cards.count} cards."
  puts "--------------------------------------------------"

  counter = 0

  cards.count.times do
    puts "This card is #{counter += 1} out of #{cards.count}"
    puts "Question: #{round_1.deck.cards[0].question}"
    print "Enter guess: "
    guess = gets.chomp
    puts "#{round_1.take_turn(guess).feedback}"
    puts ""
  end

  puts "****** Game Over! ******"
  if round_1.number_correct <= 1
    puts "You had #{round_1.number_correct} correct guess out of #{cards.count} for a total score of #{round_1.percent_correct}%."
  else
    puts "You had #{round_1.number_correct} correct guesses out of #{cards.count} for a total score of #{round_1.percent_correct}%."
  end
  puts "STEM - #{round_1.percent_correct_by_category(:STEM)}% correct"
  puts "Turing Staff - #{round_1.percent_correct_by_category(:Turing)}% correct"
  puts "Pop Culture - #{round_1.percent_correct_by_category("Pop Culture")}% correct"
  puts ""
  puts "Thank you for playing!"
end

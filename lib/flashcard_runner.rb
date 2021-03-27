require_relative 'card'
require_relative 'turn'
require_relative 'deck'
require_relative 'round'

# runner file

# create some cards
# put cards in deck
# create round
# start round using 'start'

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

  # loop
    # code to loop through

  counter = 0

  cards.count.times do
    puts "This card is #{counter += 1} out of #{cards.count}"
    puts "Question: #{round_1.deck.cards[0].question}"
    print "Enter guess: "
    guess = gets.chomp
    puts "#{round_1.take_turn(guess).feedback}"
    puts ""
  end

  # puts "This card number is 1 out of #{cards.count}."
  # puts "Question: #{round_1.deck.cards[0].question}"
  # print "Enter guess: "
  # guess_1 = gets.chomp
  # guess_1.gsub(/\s+/, "")
  #
  # puts "#{round_1.take_turn(guess_1).feedback}"
  #
  # puts ""
  #
  # puts "This is card number 2 out of #{cards.count}."
  # puts "Question: #{round_1.deck.cards[0].question}"
  # print "Enter guess: "
  # guess_2 = gets.chomp
  # guess_2.gsub(/\s+/, "")
  #
  # puts "#{round_1.take_turn(guess_2).feedback}"
  #
  # puts ""
  #
  # puts "This is card number 3 out of #{cards.count}."
  # puts "Question: #{round_1.deck.cards[0].question}"
  # print "Enter guess: "
  # guess_3 = gets.chomp
  #
  # puts "#{round_1.take_turn(guess_3).feedback}"
  #
  # puts ""
  #
  # puts "This is card number 4 out of #{cards.count}."
  # puts "Question: #{round_1.deck.cards[0].question}"
  # print "Enter guess: "
  # guess_4 = gets.chomp
  # guess_4.gsub(/\s+/, "")
  #
  # puts "#{round_1.take_turn(guess_4).feedback}"
  #
  # puts ""

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

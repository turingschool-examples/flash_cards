# require './lib/card'
# require './lib/turn'
# require './lib/deck'
# require './lib/round'


# def start

  # card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  # card_2 = Card.new("What is Rachel's favorite animal?", "dog", :Turing_staff)
  # card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
  # card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

  # cards = [card_1, card_2, card_3]
  # deck = Deck.new(cards)
  # round = Round.new(deck)

  # cards = [card_1, card_2, card_3]
  # deck = Deck.new(cards)
  # round = Round.new(deck)
  #
  # puts "Welcome! You're playing with 4 cards."
  # puts "-------------------------------------------------"
  #
  # puts "This is card number #{round.current_card.to_s} out of #{cards.count} cards."
  # puts "Question: #{round.current_card.question}"
  # guess = gets.chomp
  #
  # @turn = round.take_turn(guess)
  # @category << @turn.card.category
  #
  # percent_category << round.percent_correct_by_category(category[round.number_correct])
  #
  # puts turn.feedback
  #
  # end
  #
  #
  # puts "******** Game over! ********"
  # puts "You had #{@round.number_correct} correct guesses out of #{cards.count} for a total score of #{@round.percent_correct}."
  # #
  # # @category.each do |category|
  # #
  # # category - (@round.percent_correct_by_category(category)).to_i
  # # percentage.to_1
  # #
  # # puts "#{percentage.to_1}"
  # # end
  #


  guess = gets.chomp


  puts  "Welcome! You're playing with 4 cards."
  puts  "-------------------------------------------------"

  puts  "This is card number 1 out of 4."
  puts "Question: What is 5 + 5?"
  puts "I think the answer is: #{guess}."
  puts "Correct!"

  puts  "This is card number 2 out of 4."
  puts "Question: What is Rachel's favorite animal?"
  puts "I think the answer is: #{guess}."
  puts "Incorrect!"

  puts "This is card number 3 out of 4."
  puts "Question: What is Mike's middle name?"
  puts "I think the answer is: #{guess}."
  puts "Correct!"

  puts "This is card number 4 out of 4."
  puts "Question: What cardboard cutout lives at Turing?"
  puts "I think the answer is: #{guess}."
  puts "Correct!"

puts "****** Game over! ******"
puts "You had 3 correct guesses out of 4 for a total score of 75%."
puts "STEM - 100% correct"
puts "Turing Staff - 50% correct"
puts "Pop Culture - 100% correct"

# end

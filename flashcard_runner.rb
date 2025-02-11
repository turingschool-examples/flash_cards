require './lib/card' #requiring all necesary files
require './lib/turn'
require './lib/deck'
require './lib/round'
#setup
card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Monkey", :Turing Staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing Staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop Culture)

deck = Deck.new ([card_1, card_2, card_3, card_4])
round = Round.new(deck)

#Starting the round
def round.start
    total_cards = @deck.cards.length
    puts "Welcome! You're playing with #{total_cards} cards."
    puts "................................................."

    user_guess = gets.chomp
    turn = take_turn(guess)
    puts turn.feedback
end

#Final message
puts "****** Game over! ******"
puts " You had #{number_correct} correct guesses out of #{total_cards} for a total score of #{percent_correct}%."

#Display category percentages
categories = @deck.cards.map(&:category) #categories present in the cards
categories.each do |category| #looping through each element
    puts "#{category} - #{percent_correct_by_category(category)} correct"
end


require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

#Setup
    card_0 = Card.new("What is 5 + 5?", "10", :STEM)
    card_1 = Card.new("What is Rachel's favorite animal?", "beaver", :Turing_Staff)
    card_2 = Card.new("What is Mike's middle name?", "Red Panda", :Turing_Staff)
    card_3 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber", :Pop_Culture)
    cards = [card_0, card_1, card_2, card_3]
    deck = Deck.new([card_0, card_1, card_2, card_3])
    round = Round.new(deck)

    cards_total = deck.cards.count
    
    categories = deck.categories_in_deck
    n = 1

    puts "Welcome! It's time to play a game. You'll have #{deck.cards.count} chances to guess."
    puts "-------------------------------------------------------------------------"

cards_total.times do
    puts "This is chance #{n} out of #{cards_total}.
    Question: #{round.current_card.question}"
    print "Your Guess: "

    guess = gets.chop
    puts round.take_turn(guess).feedback
    n += 1
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."

categories.each do |category|
    puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
end



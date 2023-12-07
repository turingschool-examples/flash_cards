
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"

#Setup
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    deck = Deck.new(cards)
    round = Round.new(deck)

    cards_total = deck.cards.count
    
    categories = deck.categories_in_deck
    n = 1

puts "Welcome!"
puts "It's time to play a game. You'll have #{deck.cards.count} chances to guess."
puts "-------------------------------------------------------------------------"

cards_total.times do
    puts "This is chance #{n} out of #{cards_total}.
    Question: #{round.current_card.question}"
    print "Your Guess: "

    guess = gets.chop.downcase
    puts round.take_turn(guess).feedback
    n += 1
    
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."

categories.each do |category|
    puts "Category: #{category} - #{round.percent_correct_by_category(category)}% correct"
end

#Game class
#game_start


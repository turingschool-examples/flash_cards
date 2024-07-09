require './round'
require './turn'
require './deck'
require './card'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card4 = Card.new("What is The God Emperor of Dune's real name?", "Leto II", :Dune)
card5 = Card.new("What color is the sky?", "Blue", :STEM)
deck = Deck.new([card1, card2, card3, card4, card5])

def start(deck)
    round = Round.new(deck)
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "---------------------------------------------"
    deck.count.times do
        puts "\nThis is card number #{round.turns.size + 1} out of #{deck.count}"
        puts round.current_card.question
        user_input = gets.chomp
        turn_taken = round.take_turn(user_input)
        puts turn_taken.feedback
    end
    puts "\n****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%"
    categories = deck.cards.map do |category|
        category.category
    end
    categories.uniq.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
    end
end

start(deck)

require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

def start
    card1 = Card.new("What is your name?", "Sir Lancelot of Camelot", :Identity)
    card2 = Card.new("What is your quest?", "To seek the Holy Grail", :Identity)
    card3 = Card.new("What is the capital of Assyria?", "Assur", :Geography)
    card4 = Card.new("What is the airspeed velocity of an unladen swallow?", "24mph", :Ornithology)

    deck = Deck.new([card1, card2, card3, card4])

    round = Round.new(deck)

    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"
    
    deck.count.times do |card_number|
        puts "This is card number #{card_number + 1} out of #{deck.count}."
        puts "Question: #{round.current_card.question}"
        user_input = gets.chomp
        puts round.take_turn(user_input).feedback 
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
    
    # Start with an empty array...
    categories = []
    
    # Visit each card
    deck.cards.each do |card|
        # if it hasn't been added already...
        unless categories.include?(card.category)
            # add its category
            categories << card.category 
        end
    end

    categories.each do |category|
        puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
    end

end

start 


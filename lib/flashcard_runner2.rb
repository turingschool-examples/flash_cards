require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'

card_1 = Card.new("What is the first letter of the alphabet?", "A", :English)
card_2 = Card.new("what is the last letter of the alphabet?", "Z", :English)
card_3 = Card.new("What is the best kind of food?", "Pizza", :JackTrivia)
card_4 = Card.new("What kind of car does Jack drive?", "Volkswagen", :JackTrivia)

@cards = [card_1, card_2, card_3, card_4]

@deck = Deck.new(@cards)

@round = Round.new(@deck)

@card_count = 0

def category_selector
    unique_categories = []
    @cards.each do |card|
        unique_categories << card.category  
    end
    unique_categories.uniq!
end

def start_game_message
    puts "Welcome! You're playing with #{@cards.count} cards."
    puts "-------------------------------------------"
end

def game_rounds
    (@cards.count).times do
        @card_count += 1
        puts "This is card number #{@card_count} out of #{@cards.count}."
        puts @round.current_card.question
    
        input1 = gets.chomp
        @round.take_turn(input1)
        @round.turns[-1].feedback
    end
end

start
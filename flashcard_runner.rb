require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'

def start
    card_1 = Card.new("What fish can generate an electrical discharge up to 600 volts?", "Electric eel", :STEM)
    card_2 = Card.new("What dystopian novel did George Orwell publish in 1949?", "1984", :Literature)
    card_3 = Card.new("Which country did the US buy Florida from?", "Spain", :History)
    card_4 = Card.new("Where does The Jungle Book take place?", "India", :Literature)
    card_5 = Card.new("What color is a giraffe's tongue?", "Black", :STEM)
    cards = [card_1, card_2, card_3, card_4, card_5]
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "-------------------------------------------------------------"
    puts "This is card number 1 out of #{round.deck.count}."
    puts "Question: #{round.deck.cards[0].instance_variable_get(:@question)}"
    turn_1 = Turn.new(answer_1, round.deck.cards[0])
    answer_1 = gets.chomp
    turn_1.feedback
    
end

start
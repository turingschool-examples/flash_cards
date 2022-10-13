require './card'

require './turn'

require './deck'

require './round'

card_1 = Card.new("Who created VW Beetle?", "Ferdinand Porsche", :History)

card_2 = Card.new("What is 6x8?", 48, :Math)

card_3 = Card.new("What is the capital of Sweden?", "Stockholm", :Geography)

card_4 = Card.new("Who was the first European to set foot in North America?", "Lief Ericsson", :History)

card_5 = Card.new("Who has won the most Formula 1 Grands Prix?", "Lewis Hamilton", :Sports)

deck = Deck.new([card_1, card_2, card_3])

$round = Round.new(deck)

def start
    puts "Welcome! You are playing with #{$round.deck.count} cards."
    puts "--------------------------------------------------"
    puts "This is card number #{$round.card_number} out of #{$round.deck.count}."
end


start

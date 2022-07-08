require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card_2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
card_3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?','North north west', :STEM)

deck = [card_1, card_2, card_3]

round = Round.new(deck)

def start
    multi_line = "
    Welcome! Your playing with #{deck.count} cards.
    ---------------------------------------------------
    This is card number #{round.turns.length} out of #{deck.count}
    Question: #{round.current_card.question}
    "
    puts multi_line

    user_answer = gets.chomp

    puts user_answer
end

start()
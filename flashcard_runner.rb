require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'


card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is Rachel's favorite animal?", "Turkey", :TuringStaff)
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :TuringStaff)
card_4 = Card.new("Question: What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)

cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

@round = Round.new(deck)

def start
@round
    p "Welcome! You're playing with 4 cards.
    -------------------------------------------------
    This is card number 1 out of 4.
    Question: What is 5 + 5?"

end

start

def game_over
    if current_card == @round.deck.cards.card_1
    p "****** Game over! ******"
"You had" @number_correct "correct guesses out of" @turns_taken "for a total score of" @percent_correct.
"STEM - " percent_correct_by_category(:STEM)
"Turing Staff - " percent_correct_by_category(:TuringStaff)
"Pop Culture - " percent_correct_by_category(:PopCulture)
    end
end
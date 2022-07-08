require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


    
    @card_1 = Card.new("What is 5 + 5?", "10", :Mathematics)
    @card_2 = Card.new("What is Rachel's favorite animal?", "Giraffe", "Turing Staff")
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")

    @deck = Deck.new([@card_1, @card_2, @card_3, @card_4])

    @round = Round.new(@deck)

    
    @round.take_turn(@round.start)
require ./lib/card
require ./lib/deck
require ./lib/turn
require ./lib/round

describe Round do
    it 'uses a deck of cards' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)

        expect(round).to be_instance_of Round
        expect(round.deck) to_eq deck
    end

    it 'has turns and starts at turn 0' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        
        deck = Deck.new([card_1, card_2, card_3])
        round = Round.new(deck)


    # pseudocode to lay out roadmap
    # need to write function to take turn, keep track of what turn it is, 
    # (Cont.) demonstrate that it is an instance of the turn class
    # also need function to deliver the number correct by category, and percent correct by category
    # Phew thats a lot

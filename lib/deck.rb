require ./lib/card
require ./lib/turn

describe Deck do
    it 'contains multiple cards' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Sports)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40")
        deck = Deck.new()
    end

    it 'knows how many cards it contains' do
    end

    it 'can return cards of a specific category' do
    end
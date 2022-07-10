require ./lib/card
require ./lib/turn

describe Deck do
    it 'contains multiple cards' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        deck = Deck.new([card_1, card_2, card_3])

        expect(deck).to be_instance_of Deck
        expect(deck.cards).to eq([card_1, card_2, card_3])
    end

    it 'knows how many cards it contains' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        deck = Deck.new([card_1, card_2, card_3])

        expect(deck.count).to eq 3
    end

    it 'can return cards of a specific category' do
        card_1 = Card.new("What is a Giant Panda's favorite food?", "Bamboo", :Animals)
        card_2 = Card.new("Where was Shohei Ohtani born?", "Oshu", :Geography)
        card_3 = Card.new("How many digits of pi do you need to calculate the circumference of the universe to within the width of a hydrogen atom?", "40", :STEM)
        deck = Deck.new([card_1, card_2, card_3])
        expect(deck.cards_in_category(:Stem)).to eq([card_3])
        expect(deck.cards_in_category(:Geography)).to eq({card_2})
        expect(deck.cards_in_category(:Pop Culture)).to eq []
    end
end

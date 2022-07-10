require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/turn.rb'
require './lib/card_generator.rb'

RSpec.describe CardGenerator do 
    it 'pulls cards from txt file' do
        filename = "cards.txt"    

        cards = CardGenerator.new(filename).cards

        expect(cards).to all be_instance_of(Card)
        expect(cards).to be_instance_of(Array)
        expect(cards.count).to eq(4)

        expect(cards[0].question).to eq("What is 5 + 5?")
        expect(cards[0].answer).to eq("10")
        expect(cards[0].category).to eq("STEM")

        expect(cards[1].question).to eq("What is Rachel's favorite animal?")
        expect(cards[1].answer).to eq("red panda")
        expect(cards[1].category).to eq("Turing Staff")

        expect(cards[2].question).to eq("What is Mike's middle name?")
        expect(cards[2].answer).to eq("nobody knows")
        expect(cards[2].category).to eq("Turing Staff")

        expect(cards[3].question).to eq("What cardboard cutout lives at Turing?")
        expect(cards[3].answer).to eq("Justin bieber")
        expect(cards[3].category).to eq("PopCulture")
    end
end

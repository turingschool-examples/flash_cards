require 'rspec'
require './lib/card_generator'
require './lib/card'

describe CardGenerator do 
    it 'exists' do 
        filename = "spec/cards.txt"

        cards = CardGenerator.new(filename)

        expect(cards).to be_a(CardGenerator)
    end

    it 'can generate cards' do
        filename = "cards.txt"

        answer_hash = {"What is 5 + 5?": "10", "What is Rachel's favorite animal?": "red panda", "What is Mike's middle name?": "nobody knows", "What cardboard cutout lives at Turing?": "Justin bieber"}
        category_hash = {"What is 5 + 5?": "STEM", "What is Rachel's favorite animal?": "Turing Staff", "What is Mike's middle name?": "Turing Staff", "What cardboard cutout lives at Turing?": "Pop Culture"}

        cards = CardGenerator.new(filename).cards

        cards.each do |card|
            expect(card.answer).to eq(answer_hash[card.question.to_sym])
            expect(card.category).to eq(category_hash[card.question.to_sym])
        end
    end
end
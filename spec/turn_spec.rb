require './lib/turn'
require './lib/card'

RSpec.describe Turn do
#If time try to figure out how to pull common methods out from all tests to simplify code

    it 'exists' do
        #Check to see a Turn object is created
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    xit 'initializes' do
        #Check to see initialization happens by checking each given parameter
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        it 'has a guess' do
            expect(turn.guess).to eq("Juneau")
        end

        it 'has a card' do
            expect(turn.card).to eq(card)
        end
    end

    xit 'checks the answer' do
        #Checks the guess with the answer on the card and sees if they're equal
        #**IF TIME** Provide edge case testing such as correct answer but punctuation 
        #is included or capitalization is wrong
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq True
    end

    xit 'provides feedback to answer' do
        #Provides a response to the user on quality of their answer
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.feedback).to be "Correct!"
    end
end
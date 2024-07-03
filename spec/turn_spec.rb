require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        #Check to see a Turn object is created
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    xit 'initializes' do
        #Check to see initialization happens by checking each given parameter
        it 'has a guess' do
        end

        it 'has a card' do
        end
    end

    xit 'checks the answer' do
        #Checks the guess with the answer on the card and sees if they're equal
        #**IF TIME** Provide edge case testing such as correct answer but punctuation 
        #is included or capitalization is wrong
    end

    xit 'provides feedback to answer' do
        #Provides a response to the user on quality of their answer
    end
end
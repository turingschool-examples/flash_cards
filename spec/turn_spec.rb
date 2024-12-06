# turn_spec.rb - run RSpec based tests on Turn class
# Yes I know these are almost redundant, just starting with being thorough

require './lib/turn'
require './lib/card'
require 'rspec'         #It seems starting with 'RSpec.describe' also takes care of this dependency
#NOTE: it appears rspec is actually not required above (I commented it out and the file still executed)

describe Turn do
    #Another option: group the following few tests into an '#initialize' description
    it 'exists' do
        #Need to create a card first, since a turn depends on it
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Fairbanks", card)

        #Assertion
        expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Fairbanks", card)

        expect(turn.card).to eq(card)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Fairbanks", card)

        expect(turn.guess).to eq("Fairbanks")
    end

    it 'check if guess correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Fairbanks", card)

        expect(turn.correct?()).to eq(false)
    end

    it 'provide feedback correctly' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Fairbanks", card)

        expect(turn.feedback()).to eq(nil)      #Since puts returns nil, this one only sorta tests it (though it does print correctly).
    end

end

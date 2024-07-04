require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before(:each) do
       @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    end
    
    it 'exists' do
        turn = Turn.new("Juneau", @card)

        expect(turn). to be_instance_of(Turn)
    end

    it 'has a guess' do
        turn = Turn.new("Juneau", @card)

        expect(turn.guess).to eq("Juneau")
    end

    it "has an instantiated card object" do
        turn = Turn.new("Juneau", @card)

        expect(turn.card).to be_instance_of(Card)
    end

    it 'has correctness' do
        turn = Turn.new("Juneau", @card)
        require 'pry'; binding.pry

        expect(turn.correct?).to be true

        turn = Turn.new("London", @card)
        
        expect(turn.correct?).to be false
    end

    it 'can produce feedback based on correctness' do
    turn = Turn.new("Juneau", @card)

    expect(turn.feedback).to eq "Correct!"

    turn = Turn.new("London", @card)
    
    expect(turn.feedback).to eq "Incorrect"

    end
end
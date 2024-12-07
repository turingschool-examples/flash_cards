require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it 'exits' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(card).to be_instance_of(Card)
    end

    it 'guesses the capital' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        expect(turn.guess).to eq("Denver")
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        expect(turn.card).to eq(card)
    end

    it 'checks the answer' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        card.answer == Turn.new("Denver", card)

        expect(card.answer).to eq("Juneau")
    end

    it 'is it correct?' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        turn = Turn.new("Denver", card)

        expect(turn.correct?).to be(false)
        # I don't think that this will work because it is only testing for this one guess.
        # Or is it becuase we are running this test for this specific card so we know that it
        # will be false so we put what the actual outcome will be? 
    end

    it 'did you win?' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        
        turn = Turn.new("Denver", card)
# I know that I need to add a method for feedback but I am not sure what i need to put in
# so that turn and feedback can equal "incorrect"
        expect(turn.feedback). to eq("Incorrect")
    end
end
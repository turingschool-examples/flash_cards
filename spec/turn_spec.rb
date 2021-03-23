require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn_1 = Turn.new("Saturn", card_1)
        expect(turn).to be_instance_of(Turn)
        expect(turn_1).to be_instance_of(Turn)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn_1 = Turn.new("Saturn", card_1)
        expect(turn.guess).to eq("Juneau")
        expect(turn_1.guess).to eq("Saturn")
    end

    it 'has an card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn_1 = Turn.new("Saturn", card_1)
        expect(turn.card).to eq(card)
        expect(turn_1.card).to eq(card_1)
    end

    it 'is correct?' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn_1 = Turn.new("Saturn", card_1)
        expect(turn.correct?).to eq(true)
        expect(turn_1.correct?).to eq(false)
    end

    it 'has feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Juneau", card)
        turn_1 = Turn.new("Saturn", card_1)
        expect(turn.feedback).to eq("Correct!")
        expect(turn_1.feedback).to eq("Incorrect.")
    end
end

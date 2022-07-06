require './lib/turn'
require './lib/card'
require 'Rspec'
require 'pry'

RSpec.describe Card do
    it 'gives feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to be(true)
        expect(turn.feedback).to eq("Correct!")
    end

    it 'gives negative feedback' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.correct?).to be(false)
        expect(turn.feedback).to eq("Incorrect.")
    end
end
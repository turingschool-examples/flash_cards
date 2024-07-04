require './lib/card'
require './lib/turn'

RSpec.configure do |config|
    config.formatter = :documentation 
    end

RSpec.describe Turn do

    it 'exists and has attributes' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn).to be_instance_of(Turn)
        expect(turn.guess).to eq("Juneau")
        expect(turn.card).to eq(card)
    end
 
    it 'can check if a guess is true' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.correct?).to eq(true)
    end   

    it 'can return correct if guess is true' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        expect(turn.feedback).to eq("Correct!")
    end
  

    it 'can check if a guess if false' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.correct?).to eq(false)
    end
    
    it 'can return incorrect if guess is false' do
        card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        turn = Turn.new("Saturn", card)
        expect(turn.feedback).to eq("Incorrect.")
    end
  
end
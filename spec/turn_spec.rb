require './lib/turn.rb'
require './lib/card.rb'


RSpec.describe Turn do
  it 'exists' do
       card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       turn = Turn.new("Juneau", card)
    
       expect(turn).to be_instance_of(Turn)
  end
   it 'it has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
   end

   it 'it has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
   end

   it ' checks the correct answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
   end
   
   it ' checks the feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct")
   
   end
end  

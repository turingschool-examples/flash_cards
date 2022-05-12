require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end



  it 'has a turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end
#require "pry"; binding.pry

  xit "has a card" do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)
   expect(turn.card).to eq("What is the capital of Alaska?", "Juneau", :Geography)
  end

  xit "has a guess" do
    turn = Turn.new("Juneau", card)
     expect(turn.guess).to eq("Juneau")
  end

  xit "has a correct answer" do
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to be true
  end

  xit "has feedback" do
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end
end

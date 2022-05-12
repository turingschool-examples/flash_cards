require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  it "has a turn" do
    turn = Turn.new("Juneau", @card)
    expect(turn.string).to eq("Juneau")
  end

  iit 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

end

require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end
  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do

    expect(@turn.guess).to eq("Juneau")
  end

  xit 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  xit 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end
end
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess). to eq("Juneau")
  end

  it 'has a card and answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(card.answer). to eq("Juneau")
  end

#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.question).to eq("What is the capital of Alaska?")
#   end

#   it 'has an answer' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.answer).to eq("Juneau")
#   end

#   it 'has a category' do
#     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

#     expect(card.category).to eq(:Geography)
#   end
end

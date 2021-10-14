require './lib/turn'

require './lib/card'

RSpec.describe Turn do
  it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

      expect(card).to be_instance_of(Card)
    end

  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn). to be_instance_of(Turn)
  end

  it 'has a card' do
    turn = Turn.new("What is the capital of Alaska?", "Juneau" :Geography)

    expect(turn.card).to eq("What is the capital of Alaska?", @answer = "Juneau", @category = :Geography)
  end

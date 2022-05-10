require './turn'

Rspec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau',card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau',card)

    expect(turn.card).to eq(card)
  end 

require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    filename = 'cards.txt'
    @cards = CardGenerator.new(filename)
  end

  it 'exists' do
    expect(@cards).to be_a(CardGenerator)
  end

  it 'returns the cards filename' do
    expect(@cards.filename).to eq('cards.txt')
  end

  it 'reads the cards file and creates Card instances for each' do
    expect(@cards.cards[0].question).to eq('Who is the greatest quarterback of all time?')
    expect(@cards.cards[0].answer).to eq('Tom Brady')
    expect(@cards.cards[0].category).to eq(:Sports)
    expect(@cards.cards[11].question).to eq("What mountain's peak is furthest from the center of the Earth?")
    expect(@cards.cards[11].answer).to eq('Chimborazo')
    expect(@cards.cards[11].category).to eq(:Geography)
  end
end

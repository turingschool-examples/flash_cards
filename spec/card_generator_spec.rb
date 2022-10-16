require './lib/card_generator'

describe CardGenerator do
  filename = "cards.txt"
  cards = CardGenerator.new(filename).cards

  it 'returns an array of cards' do
    card.each do |card|
      expect(card).to be_a Card
    end
  end

  it 'reads the question from cards.txt' do
    expect(cards[0].question) to eq "What is the capital of Alaska?"
  end

  it 'reads the answer from cards.txt' do
    expect(cards[0].answer) to eq "Juneau"
  end

  it 'reads the category from cards.txt' do
    expect(cards[0].category) to eq :Geography
  end

end

require './lib/card_generator'


describe CardGenerator do
  it 'converts text file into cards' do
    cards_array = CardGenerator.new("./cards.txt")
    expect(cards_array.cards_generator_array.length).to eq(4)
  end

  it 'formats cards properly' do
    cards_array = CardGenerator.new("./cards.txt")
    expect(cards_array.cards_generator_array[0].question).to eq('What is 5 + 5?')
    expect(cards_array.cards_generator_array[2].answer).to eq('nobody knows')
  end
end

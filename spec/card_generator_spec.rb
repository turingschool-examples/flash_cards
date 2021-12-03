require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator).to be_an_instance_of(CardGenerator)
  end

  it 'takes file as argument' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.filename).to eq("cards.txt")
  end

  it 'has first card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    expect(generator.cards[0]).to be_an_instance_of(Card)
    expect(generator.cards[0].question).to eq("What is 5 + 5?")
    expect(generator.cards[0].answer).to eq('10')
    expect(generator.cards[0].category).to eq('STEM')
  end

  it 'has second card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    expect(generator.cards[1]).to be_an_instance_of(Card)
    expect(generator.cards[1].question).to eq("What is Rachel's favorite animal?")
    expect(generator.cards[1].answer).to eq('red panda')
    expect(generator.cards[1].category).to eq('Turing Staff')
  end

  it 'has third card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    expect(generator.cards[2]).to be_an_instance_of(Card)
    expect(generator.cards[2].question).to eq("What is Mike's middle name?")
    expect(generator.cards[2].answer).to eq('nobody knows')
    expect(generator.cards[2].category).to eq('Turing Staff')
  end

  it 'has fourth card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    expect(generator.cards[3]).to be_an_instance_of(Card)
    expect(generator.cards[3].question).to eq("What cardboard cutout lives at Turing?")
    expect(generator.cards[3].answer).to eq('Justin bieber')
    expect(generator.cards[3].category).to eq('Pop Culture')
  end
end

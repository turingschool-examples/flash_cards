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

  it 'has cards' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.cards).to eq([])
  end
end

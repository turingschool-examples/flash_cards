require 'rspec'
require './lib/card_generator'

RSpec.describe do CardGenerator
  it "exists" do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator).to be_a(CardGenerator)
  end

  it "can generate cards" do
    filename = "cards.txt"
    generator = CardGenerator.new('cards.txt')

    card_1 = generator.cards[0]
    expect(card_1.question).to eq("What is 5 + 5?")
    expect(card_1.answer).to eq("10")
    expect(card_1.category).to eq(:STEM)
    expect(generator.cards.length).to eq(4)
  end

  it "does not generate the wrong card" do
    filename = "cards.txt"
    generator = CardGenerator.new('cards.txt')

    card_1 = generator.cards[0]
    expect(card_1.question).to_not eq("d")
    expect(card_1.answer).to_not eq("d")
    expect(card_1.category).to_not eq(:d)
  end
end

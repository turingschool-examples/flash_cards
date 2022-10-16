require './lib/CardGenerator'
file = './lib/cards.txt'

RSpec.describe CardGenerator do
  it 'is part of the CardGenerator class' do
    new_cards = CardGenerator.new(file)

    expect(new_cards).to be_a(CardGenerator)
  end

  it 'creates an array of outputs' do
    new_cards = CardGenerator.new(file)

    expect(new_cards.cards).to be_a(Array)
  end

  it 'creates new cards' do
    new_cards = CardGenerator.new(file)
    new_cards.make_cards

    new_cards.cards.each do |card|
    expect(card).to be_a(Card) 
    end
  end

  it 'creates first card with the correct info' do
    new_cards = CardGenerator.new(file)
    new_cards.make_cards

    expect(new_cards.cards[0].question).to eq("What is 5 + 5?")
    expect(new_cards.cards[0].answer).to eq("10")
    expect(new_cards.cards[0].category).to eq("STEM")
  end

  it 'creates second card with the correct info' do
    new_cards = CardGenerator.new(file)
    new_cards.make_cards

    expect(new_cards.cards[1].question).to eq("What is Rachel's favorite animal?")
    expect(new_cards.cards[1].answer).to eq("red panda")
    expect(new_cards.cards[1].category).to eq("Turing Staff")
  end
end

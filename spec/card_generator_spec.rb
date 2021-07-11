
require './lib/card_generator.rb'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_a(CardGenerator)
  end

  it 'puts cards data into a collection' do
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.file_data).to eq(["In Harry Potter what class does Professor McGonagall teach?,Transfiguration,Harry Potter",
    "What is the name of Harry Potter's pet owl?,Hedwig,Harry Potter",
    "On Schitt's Creek what kind of disgruntled animal does David act like?,Pelican,Schitt's Creek",
    "What is Leslie Knope's favorite food?,Waffles,Parks & Rec"])
  end

  it 'takes card data and breaks each card into an array' do
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.edit_cards_text).to eq ([["In Harry Potter what class does Professor McGonagall teach?", "Transfiguration","Harry Potter"],
    ["What is the name of Harry Potter's pet owl?", "Hedwig", "Harry Potter"],
    ["On Schitt's Creek what kind of disgruntled animal does David act like?", "Pelican", "Schitt's Creek"],
    ["What is Leslie Knope's favorite food?", "Waffles", "Parks & Rec"]])
  end
end

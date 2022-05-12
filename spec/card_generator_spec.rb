require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'can store a text file' do

    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.filename).to eq("cards.txt")
  end

  # I am adding "x" to tests as I make edits to card_generator.rb that will make this test fail. I still wanted to keep these tests and not delete them to document my process for building the code.
  xit 'can generate the first line in the txt file' do

    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.cards).to eq("What is 5 + 5?,10,STEM\n")
  end

  xit 'can create an array of the first line in the txt file' do

    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.cards).to eq(["What is 5 + 5?", "10", "STEM"])
  end

  xit 'can input array into new Card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.cards

    expect(generator.cards).to be_instance_of(Card)
  end

  it "can shovel Card into card_deck" do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.cards

    expect(generator.card_deck[0].category).to eq("STEM")
  end
end

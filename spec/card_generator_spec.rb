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

    expect(generator.compiler ).to eq("What is 5 + 5?,10,STEM\n")
  end

  xit 'can create an array of the first line in the txt file' do

    filename = "cards.txt"
    generator = CardGenerator.new(filename)

    expect(generator.compiler ).to eq(["What is 5 + 5?", "10", "STEM"])
  end

  xit 'can input array into new Card' do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.compiler

    expect(generator.compiler ).to be_instance_of(Card)
  end

  it "can shovel Card into cards" do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.compiler

    expect(generator.cards[0].category).to eq("STEM")
  end

  it "can iterate through each line of the file" do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.compiler

    expect(generator.cards.count).to eq(4)
  end

  it "stores all four lines in the cards attribute" do
    filename = "cards.txt"
    generator = CardGenerator.new(filename)
    generator.compiler

    expect(generator.cards[0].answer).to eq("10")
    expect(generator.cards[1].category).to eq("Turing Staff")
    expect(generator.cards[2].question).to eq("What is Mike's middle name?")
    expect(generator.cards[3].answer).to eq("Justin bieber")
  end
end

require './lib/card_generator'
require './lib/card'
require './lib/deck'

RSpec.describe Card_generator do

  it "file name is cards.txt" do
    filename = './lib/cards.txt'
    expect(filename).to eq('./lib/cards.txt')
  end

  it "is a Card_generator" do
    filename = './lib/cards.txt'
    cards = Card_generator.new(filename)
    expect(cards).to be_instance_of(Card_generator)
  end

  it "is a Card_generator" do
    filename = './lib/cards.txt'
    cards = Card_generator.new(filename).card_reader
    expect(cards).to eq([["What is 5 + 5?", "10", "STEM"],
    ["What is Rachel's favorite animal?", "red panda", "Turing Staff"],
    ["What is Mike's middle name?", "nobody knows", "Turing Staff"],
    ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]])
  end


end

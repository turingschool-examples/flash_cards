require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'
require 'pry'


RSpec.describe CardGenerator do

  it 'is an instance of CardGenerator' do
    filename = File.open("cards.txt")
    cards = CardGenerator.new(filename)

    expect(CardGenerator.new(filename)).to be_instance_of(CardGenerator)
  end

  it 'can read the txt file' do
    filename = File.open("cards.txt")
    cards = CardGenerator.new(filename)

    expect(CardGenerator.new(filename).txt_cards).to eq["What is 5 + 5?,10,STEM",
      "What is Rachel's favorite animal?,red panda,Turing Staff",
      "What is Mike's middle name?,nobody knows,Turing Staff",
      "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"]
  end

end

require './lib/card_generator'
require './lib/card'
require 'pry'

RSpec.describe do CardGenerator
  it "exists" do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator).to be_an_instance_of(CardGenerator)
  end

  it "can read a file" do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator.read_file).to be_a(String)
  end

  it "separate file data into separate card info" do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator.separate_card_data).to be_an(Array)
  end

  it "can make an array of 3 strings" do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator.make_strings).to be_an(Array)
  end

  it "can make a new card" do
    card_generator = CardGenerator.new('cards.txt')

    expect(card_generator.cards).to be_an(Array)
  end

  it "can close the file" do
    card_generator = CardGenerator.new(File.open('cards.txt' ,'r'))

    expect(card_generator.close_file).to eq(nil)
  end
end

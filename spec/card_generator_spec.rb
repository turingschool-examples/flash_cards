require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    cards_test = CardGenerator.new("cards.txt")

    expect(cards_test).to be_instance_of(CardGenerator)
  end

  describe "#initialize" do
    it "has the correct file passed and stored" do
      cards_test = CardGenerator.new("cards.txt")
      actual = cards_test.filename
      expect(actual).to eq("cards.txt")
    end

    it "has an array of cards that match those from the text file" do
      cards_test = CardGenerator.new("cards.txt")

      expect(cards_test.cards).to be_instance_of(Array)
      end
  end
end

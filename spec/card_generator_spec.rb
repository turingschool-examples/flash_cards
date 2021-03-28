require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    cards = CardGenerator.new("cards.txt")
# binding.pry
    expect(cards).to be_instance_of(CardGenerator)
  end

  describe "#initialize" do
    it "has the correct file passed and stored" do
      cards = CardGenerator.new("cards.txt")
      actual = cards.filename
      expect(actual).to eq("cards.txt")
    end

    it "has an array of cards that match those from the text file" do
      cards = CardGenerator.new("cards.txt")
        cards.create_cards
      expect(cards.cards).to be_instance_of(Array)
      end
  end
end

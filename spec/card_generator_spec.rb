require '../lib/card_generator'
require '../lib/card'

RSpec.describe CardGenerator do
  let(:filename) {"cards.txt"}
  subject {CardGenerator.new(filename)}

  it "accepts a filename" do
    expect(subject.filename).to eq("cards.txt")
  end

  context "#cards" do
    it "returns an array" do
      expect(subject.cards).to be_an Array
    end

    it "returns number of cards" do
      expect(subject.cards.count).to eq(4)
    end

    it "returns array of Card objects" do
      expect(subject.cards[0]).to be_a Card
    end
  end
end

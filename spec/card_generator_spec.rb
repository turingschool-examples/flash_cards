require './lib/card_generator'

describe CardGenerator do
  describe '#initialize' do
    it 'is an instance of CardGenerator' do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator).to be_a CardGenerator
    end
  end

  describe "#card_data" do
    it "read the file and return the array of card data" do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator.card_data).to eq ["What is the capital of Alaska?,Juneau,Geography", "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?,Mars,STEM", "Describe in words the exact direction that is 697.5° clockwise from due north?,North north west,STEM", "How many episodes does Friends sitcom have?,236 eps,Movies", "Who is the first Asian actor/actress to win Oscar?,Michelle Yeoh,Movies"]
    end
  end

  describe "#card" do
    it "split the card data into 3 components" do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator.card).to be_a (Card)
    end
  end

end

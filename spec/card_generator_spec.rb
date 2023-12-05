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

  describe "#cards" do
    it "create cards instances with 3 components: question, answer, category" do
      card_generator = CardGenerator.new("cards.txt")
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
      card_4 = Card.new("How many episodes does Friends sitcom have?", "236 eps", "Movies")
      card_5 = Card.new("Who is the first Asian actor/actress to win Oscar?", "Michelle Yeoh", "Movies")

      expect(card_generator.cards).to eq([card_1, card_2, card_3, card_4, card_5])
    end
  end

end

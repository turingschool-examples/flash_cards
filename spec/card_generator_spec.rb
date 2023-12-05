require "./lib/card"
require "./lib/card_generator"

RSpec.describe CardGenerator do

    it "exists" do
        text_file = CardGenerator.new("cards.txt")
        
        expect(text_file).to be_instance_of(CardGenerator)
    end

    it "can name of file being used" do
        text_file = CardGenerator.new("cards.txt")
        
        expect(text_file.file_name).to eq("cards.txt")
    end

    it "converts lines of text to Card class" do
        cards = CardGenerator.new("cards.txt").cards
        
        expect(cards[0]).to be_instance_of(Card)
        expect(cards[2]).to be_instance_of(Card)
    end
end
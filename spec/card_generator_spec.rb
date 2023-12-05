require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
   let(:filename) { "cards.txt" }

   it "exists" do
      card_generator = CardGenerator.new(filename)
      expect(card_generator).to be_instance_of CardGenerator
   end

   it "reads lines from file" do
      card_generator = CardGenerator.new(filename)
      expect(card_generator.card_lines).to be_an Array
   end

   it "creates a card object from each line" do
      card_generator = CardGenerator.new(filename)
      line = "What is 5 + 5?,10,STEM"
      card = card_generator.create_card_from_line(line)
      expect(card).to be_instance_of Card
      expect(card.question).to eq "What is 5 + 5?"
      expect(card.answer).to eq "10"
      expect(card.category).to eq "STEM"
   end

   it "returns an array of card objects" do
      card_generator = CardGenerator.new(filename)
      cards = card_generator.cards
      expect(cards).to be_an Array
      expect(cards[0]).to be_instance_of Card
      expect(cards[1]).to be_instance_of Card
      expect(cards[2]).to be_instance_of Card
   end
end

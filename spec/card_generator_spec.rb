require './lib/card_generator'

filename = "./cards.txt"

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

    it 'can read the text file' do
      cards = CardGenerator.new(filename)
    

      expect(cards.card_data).to eq ["Where is the house from the painting American Gothic located?,Eldon IA,Art History",
      "What driver holds the record for most Formula 1 race wins in a row?,Sebastian Vettel,Sports",
      "What country won the 2014 Football World Cup in Brazil?,Germany,Sports",
      "Who burned down the White House during the War of 1812?,Canada,History",
      "What is 144/12?,12,Math"]
    end

    it 'can convert the text file into cards' do
      cards = CardGenerator.new(filename).cards_inputted

      cards.each do |card|
        expect(card).to be_instance_of(Card)
      end
    end

    it "converts questions, answers, and categories correctly" do
      cards = CardGenerator.new(filename).cards_inputted

      expect(cards[0].question).to eq("Where is the house from the painting American Gothic located?")

      expect(cards[0].answer).to eq("Eldon IA")

      expect(cards[0].category).to eq("Art History")
    end
  end
end
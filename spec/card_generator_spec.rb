require './lib/card_generator'

filename = "./lib/cards.txt"

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

    it 'can read the text file' do
      cards = CardGenerator.new(filename)
    

      expect(cards.card_data).to eq ["Where is the house from the painting American Gothic located?, Eldon IA, Art History", 
      "What two drivers jointly hold the record for most Formula One World Championships?, Michael Schumacher and Lewis Hamilton, Sports"]
    end

    it 'can convert the text file into a deck' do
      cards = CardGenerator.new(filename).cards
      require 'pry'; binding.pry
      expect(cards).to eq
    end
  end
end